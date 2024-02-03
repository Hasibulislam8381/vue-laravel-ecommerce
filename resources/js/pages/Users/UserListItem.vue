<script setup>
import { ref, defineProps, defineEmits } from 'vue';
import axios from 'axios';
import { useToastr } from '../../toastr.js';

const toastr = useToastr();
const { user, index } = defineProps(['user', 'index']);
const emit = defineEmits(['userDeleted']);
const userIdToDelete = ref(null);

// TO Delete user
const confirmUserDeletion = () => {
    $('#deleteUserModal').modal('show');
}

const deleteUser = async (userToDelete) => {
    try {
        if (userToDelete.id !== null) {
            await axios.delete(`/api/users/${userToDelete.id}`);
            toastr.success("User deleted Successfully");
            $('#deleteUserModal').modal('hide');
            emit('userDeleted', userToDelete.id);
        } else {
            console.error('User ID is null or invalid');
            // Handle the case where the user ID is null or invalid (optional)
        }
    } catch (error) {
        console.error('Error deleting user:', error);
        toastr.error("Error deleting user");
    }
}
</script>

<template>
    <tr>
        <th scope="row">{{ user.id }}</th>
        <td>{{ user.name }}</td>
        <td>{{ user.email }}</td>
        <td>{{ user.created_at }}</td>
        <td>{{ user.role }}</td>
        <td>
            <a href="#" @click.prevent="editUser(user)"><i class="fa fa-edit"></i></a>
            <a href="#" @click.prevent="confirmUserDeletion(user)"><i class="fa fa-trash text-danger ml-2"></i></a>
        </td>
    </tr>
    <!-- Delete user Modal -->
    <div class="modal fade" id="deleteUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <span>Delete User</span>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>Are you sure to Delete this user ?</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" @click.prevent="() => deleteUser(user)" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>
</template>
