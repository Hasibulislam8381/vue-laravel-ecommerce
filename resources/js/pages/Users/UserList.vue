<script setup>
import axios from 'axios';
import { ref, onMounted, reactive } from 'vue';
import { Form, Field, useSetFieldError } from 'vee-validate';
import * as yup from 'yup';
import { useToastr } from '../../toastr.js';
import UserListItem from './UserListItem.vue';

const toastr = useToastr();

const users = ref([]);

const editing = ref(false);
const formValues = ref({});

const form = ref(null);



const getUsers = () => {
    axios.get('/api/users')
        .then((response) => {
            users.value = response.data;


        });
};

const schema = yup.object({
    name: yup.string().required(),
    email: yup.string().email().required(),
    password: yup.string().required().min(8),
});
const editschema = yup.object({
    name: yup.string().required(),
    email: yup.string().email().required(),
    password: yup.string().when((password, schema) => {
        return password ? schema.required().min(8) : schema;
    }),

});

const createUser = (values, { resetForm, setFieldError }) => {

    axios.post('/api/users', values)
        .then((response) => {
            users.value.unshift(response.data);
            $('#userFormModal').modal('hide');
            resetForm();
            toastr.success('User Created Successfull');

        })

        .catch((error) => {
            if (error.response.data.errors) {
                setFieldError('email', error.response.data.errors.email[0]);
            }

        })
};

const addUser = () => {
    editing.value = false;
    $('#userFormModal').modal('show');

};

const editUser = (user) => {
    editing.value = true;
    form.value.resetForm();
    $('#userFormModal').modal('show');
    formValues.value = {
        id: user.id,
        name: user.name,
        email: user.email,
    };
    console.log(formValues.value); // Add this line
};

const updateUser = (values, { setFieldError }) => {
    axios.put('/api/users/' + formValues.value.id, values)
        .then((response) => {
            const index = users.value.findIndex(user => user.id === response.data.id);
            users.value[index] = response.data;
            $('#userFormModal').modal('hide');
            toastr.success('User Updated Successfull');
        })
        .catch((error) => {
            setFieldError('email', error.response.data.errors.email[0]);
            console.log(error);
        })

}
const handleSubmit = (values, actions) => {

    if (editing.value) {
        updateUser(values, actions);
    }
    else {
        createUser(values, actions);
    }
}

const userDeleted = (userId) => {
    users.value = users.value.filter(user => user.id !== userId);
}


onMounted(() => {
    getUsers();

});
</script>
<template>
    <div>
        <div class="content-header">

            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Users</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Users</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="add_user_btn">
                    <button @click="addUser" type="button" class="btn btn-primary">Add New
                        User</button>
                </div>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Register Date</th>
                            <th scope="col">Role</th>
                            <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody>

                        <!-- In your main component template -->

                        <UserListItem v-for="(user, index) in users" :key="user.id" :user="user" :index="index"
                            @user-deleted="userDeleted" />



                    </tbody>
                </table>



            </div>
        </div>
    </div>

    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="userFormModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <span v-if="editing">Edit User</span>
                        <span v-else>Add new User</span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <Form ref="form" @submit="handleSubmit" :validation-schema="editing ? editschema : schema"
                    v-slot="{ errors }">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <Field name="name" v-model="formValues.name" type="name" :class="{ 'is-invalid': errors.name }"
                                class="form-control" placeholder="Enter Full Name" />
                            <span class="invalid-feedback">{{ errors.name }}</span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <Field name="email" v-model="formValues.email" type="email"
                                :class="{ 'is-invalid': errors.email }" class="form-control"
                                placeholder="Enter User Email" />
                            <span class="invalid-feedback">{{ errors.email }}</span>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <Field name="password" type="password" :class="{ 'is-invalid': errors.password }"
                                class="form-control" placeholder="Enter Password" />
                            <span class="invalid-feedback">{{ errors.password }}</span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </Form>
            </div>
        </div>
    </div>
</template>





<style>
.add_user_btn {
    padding-bottom: 10px;
}
</style>
