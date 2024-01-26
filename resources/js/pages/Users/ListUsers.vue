<script setup>
import axios from 'axios';
import { ref, onMounted } from 'vue';

const users = ref([]);

const getUsers = () => {
    axios.get('/api/users')
        .then((response) => {
            users.value = response.data;

        });
};

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
                            <td>mark@gmail.com</td>
                            <td>12 aug,2023</td>
                            <td></td>
                            <td></td>
                        </tr>


                    </tbody>
                </table>



            </div>
        </div>
    </div>
</template>
