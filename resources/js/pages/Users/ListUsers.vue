<script setup>
import axios from 'axios';
import { ref, onMounted, reactive } from 'vue';
import { Form, Field } from 'vee-validate';
import * as yup from 'yup';

const users = ref([]);

const editing = ref(false);

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
})

const createUser = (values, { resetForm }) => {

    axios.post('/api/users', values)
        .then((response) => {
            users.value.unshift(response.data);
            $('#userFormModal').modal('hide');
            resetForm();

        });
};

const editUser = () => {
    editing.value = true;
    $('#userFormModal').modal('show');
};
const addUser = () => {
    editing.value = false;
    $('#userFormModal').modal('show');
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
                        <tr v-for="user in users" :key="user.id">
                            <th scope="row">{{ user.id }}</th>
                            <td>{{ user.name }}</td>
                            <td>{{ user.email }}</td>
                            <td>12 aug,2023</td>
                            <td></td>
                            <td>
                                <a href="#" @click.prevent="editUser(user)"><i class="fa fa-edit"></i></a>
                            </td>
                        </tr>


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
                        <span v-else>Add a new User</span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <Form @submit="createUser" :validation-schema="schema" v-slot="{ errors }">
                    <div class="modal-body">

                        <label for="name">Name</label>
                        <Field name="name" type="name" :class="{ 'is-invalid': errors.name }" class="form-control"
                            placeholder="Enter Full Name" />
                        <span class="invalid-feedback">{{ errors.name }}</span><br>
                        <label for="email">Email</label>
                        <Field name="email" type="email" :class="{ 'is-invalid': errors.email }" class="form-control"
                            placeholder="Enter User Email" />
                        <span class="invalid-feedback">{{ errors.email }}</span><br>
                        <label for="password">Password</label>
                        <Field name="password" type="password" :class="{ 'is-invalid': errors.password }"
                            class="form-control" placeholder="Enter Password" />
                        <span class="invalid-feedback">{{ errors.password }}</span><br>
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
