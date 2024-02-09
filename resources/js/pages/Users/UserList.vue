<script setup>
import axios from "axios";
import { ref, onMounted, reactive, watch } from "vue";
import { Form, Field, useSetFieldError } from "vee-validate";
import * as yup from "yup";
import { useToastr } from "../../toastr.js";
import { debounce } from "lodash";
import { Bootstrap4Pagination } from "laravel-vue-pagination";

const toastr = useToastr();

const users = ref({ data: [] });

const editing = ref(false);
const formValues = ref({});

const form = ref(null);
const userIdToDelete = ref(null);

const getUsers = () => {
    axios.get(`/api/users`).then((response) => {
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
    axios
        .post("/api/users", values)
        .then((response) => {
            users.value.unshift(response.data);
            $("#userFormModal").modal("hide");
            resetForm();
            toastr.success("User Created Successfull");
        })

        .catch((error) => {
            if (error.response.data.errors) {
                setFieldError("email", error.response.data.errors.email[0]);
            }
        });
};

const addUser = () => {
    editing.value = false;
    $("#userFormModal").modal("show");
};

const editUser = (user) => {
    editing.value = true;
    form.value.resetForm();
    $("#userFormModal").modal("show");
    formValues.value = {
        id: user.id,
        name: user.name,
        email: user.email,
    };
    console.log(formValues.value); // Add this line
};

const updateUser = (values, { setFieldError }) => {
    axios
        .put("/api/users/" + formValues.value.id, values)
        .then((response) => {
            const index = users.value.findIndex(
                (user) => user.id === response.data.id
            );
            users.value[index] = response.data;
            $("#userFormModal").modal("hide");
            toastr.success("User Updated Successfull");
        })
        .catch((error) => {
            setFieldError("email", error.response.data.errors.email[0]);
            console.log(error);
        });
};
const handleSubmit = (values, actions) => {
    if (editing.value) {
        updateUser(values, actions);
    } else {
        createUser(values, actions);
    }
};

const confirmUserDeletion = (user) => {
    userIdToDelete.value = user.id;
    $("#deleteUserModal").modal("show");
};

const deleteUser = () => {
    axios
        .delete(`/api/users/${userIdToDelete.value}`)
        .then(() => {
            toastr.success("User deleted Successfully");
            $("#deleteUserModal").modal("hide"); // Close the delete modal after successful deletion
            users.value = users.value.filter(
                (user) => user.id !== userIdToDelete.value
            );
        })
        .catch((error) => {
            console.error("Error deleting user:", error);
            toastr.error("Error deleting user");
        });
};

const roles = ref([
    {
        name: "ADMIN",
        value: 1,
    },
    {
        name: "USER",
        value: 2,
    },
]);

const changeRole = (user, role) => {
    axios
        .patch(`/api/users/${user.id}/change-role`, {
            role: role,
        })
        .then(() => {
            toastr.success("Role Changed Successfully");
        });
};

const searchQuery = ref(null);

const search = () => {
    axios
        .get("/api/users/search", {
            params: {
                query: searchQuery.value,
            },
        })
        .then((response) => {
            users.value = response.data;
        })
        .catch((error) => {
            console.log(error);
        });
};

const selectedUsers = ref([]);

const toggleSelection = (event, user) => {
    const index = selectedUsers.value.indexOf(user.id);
    if (index === -1) {
        selectedUsers.value.push(user.id);
    } else {
        selectedUsers.value.splice(index, 1);
    }

    console.log(selectedUsers.value);
};

const bulkDelete = () => {
    axios
        .delete("/api/users", {
            data: {
                ids: selectedUsers.value,
            },
        })
        .then((response) => {
            users.value = users.value.filter(
                (user) => !selectedUsers.value.includes(user.id)
            );
            selectedUsers.value = [];
            toastr.success(response.data.message);
        });
};

watch(
    searchQuery,
    debounce(() => {
        search();
    }, 300)
);

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
                            <li class="breadcrumb-item">
                                <a href="#">Home</a>
                            </li>
                            <li class="breadcrumb-item active">Users</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="add_user_btn">
                    <div class="row">
                        <div class="col-md-4">
                            <div>
                                <button
                                    @click="addUser"
                                    type="button"
                                    class="btn btn-primary"
                                >
                                    Add New User
                                </button>
                                <button
                                    v-if="selectedUsers.length > 0"
                                    @click="bulkDelete"
                                    type="button"
                                    class="ml-2 btn btn-danger"
                                >
                                    Delete all User
                                </button>
                            </div>
                        </div>
                        <div class="col-md-8 d-flex">
                            <input
                                type="text"
                                v-model="searchQuery"
                                class="form-control"
                                placeholder="Search.."
                            />
                            <div>
                                <button
                                    @click.prevent="search"
                                    class="btn btn-primary ml-3"
                                >
                                    Submit
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th><input type="checkbox" /></th>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Register Date</th>
                            <th scope="col">Role</th>
                            <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody v-if="users.length > 0">
                        <tr v-for="user in users" :key="user.id">
                            <th>
                                <input
                                    type="checkbox"
                                    @change="
                                        ($event) =>
                                            toggleSelection($event, user)
                                    "
                                    name=""
                                    id=""
                                />
                            </th>
                            <th scope="row">{{ user.id }}</th>
                            <td>{{ user.name }}</td>
                            <td>{{ user.email }}</td>
                            <td>{{ user.created_at }}</td>
                            <td>
                                <select
                                    class="form-control"
                                    @change="
                                        changeRole(user, $event.target.value)
                                    "
                                >
                                    <option
                                        v-for="role in roles"
                                        :value="role.value"
                                        :selected="user.role === role.name"
                                    >
                                        {{ role.name }}
                                    </option>
                                </select>
                            </td>
                            <td>
                                <a href="#" @click.prevent="editUser(user)"
                                    ><i class="fa fa-edit"></i
                                ></a>
                                <a
                                    href="#"
                                    @click.prevent="confirmUserDeletion(user)"
                                    ><i class="fa fa-trash text-danger ml-2"></i
                                ></a>
                            </td>
                        </tr>
                    </tbody>
                    <tbody v-else>
                        <tr>
                            <td colspan="6" class="text-center">
                                No results found..
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <Bootstrap4Pagination
            :data="users"
            @pagination-change-page="getUsers"
        />
    </div>

    <!-- Button trigger modal -->

    <!-- Modal -->
    <div
        class="modal fade"
        id="userFormModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <span v-if="editing">Edit User</span>
                        <span v-else>Add new User</span>
                    </h5>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <Form
                    ref="form"
                    @submit="handleSubmit"
                    :validation-schema="editing ? editschema : schema"
                    v-slot="{ errors }"
                >
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <Field
                                name="name"
                                v-model="formValues.name"
                                type="name"
                                :class="{ 'is-invalid': errors.name }"
                                class="form-control"
                                placeholder="Enter Full Name"
                            />
                            <span class="invalid-feedback">{{
                                errors.name
                            }}</span>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <Field
                                name="email"
                                v-model="formValues.email"
                                type="email"
                                :class="{ 'is-invalid': errors.email }"
                                class="form-control"
                                placeholder="Enter User Email"
                            />
                            <span class="invalid-feedback">{{
                                errors.email
                            }}</span>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <Field
                                name="password"
                                type="password"
                                :class="{ 'is-invalid': errors.password }"
                                class="form-control"
                                placeholder="Enter Password"
                            />
                            <span class="invalid-feedback">{{
                                errors.password
                            }}</span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="submit" class="btn btn-primary">
                            Save
                        </button>
                    </div>
                </Form>
            </div>
        </div>
    </div>
    <div
        class="modal fade"
        id="deleteUserModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <span>Delete User</span>
                    </h5>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                    >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>Are you sure to Delete this user ?</h5>
                </div>

                <div class="modal-footer">
                    <button
                        type="button"
                        class="btn btn-secondary"
                        data-dismiss="modal"
                    >
                        Close
                    </button>
                    <button
                        type="button"
                        @click.prevent="deleteUser"
                        class="btn btn-danger"
                    >
                        Delete
                    </button>
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
