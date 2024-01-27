<script setup>
import axios from 'axios';
import { ref, onMounted, reactive } from 'vue';

const users = ref([]);

const form = reactive({
    name: '',
    email: '',
    password: ''
});

const getUsers = () => {
    axios.get('/api/users')
        .then((response) => {
            users.value = response.data;

        });
};

const createUser = () => {

    axios.post('/api/users', form)
        .then((response) => {
            users.value.unshift(response.data);
            form.name = '',
                form.email = '',
                form.password = '',

                $('#createUserModal').modal('hide');

        });

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
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createUserModal">Add New
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
                            <td></td>
                        </tr>


                    </tbody>
                </table>



            </div>
        </div>
    </div>

    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="createUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add a new User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <label for="name">Name</label>
                        <input v-model="form.name" type="name" class="form-control" placeholder="Enter Full Name">
                        <label for="email">Email</label>
                        <input v-model="form.email" type="email" class="form-control" placeholder="Enter User Email">
                        <label for="password">Password</label>
                        <input v-model="form.password" type="password" class="form-control" placeholder="Enter Password">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button @click="createUser" type="button" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
.add_user_btn {
    padding-bottom: 10px;
}
</style>
