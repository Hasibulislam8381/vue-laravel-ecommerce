
<script setup>

defineProps({
    user: Object,
    index: Number
})

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
</template>
