import Dashboard from "./components/Dashboard.vue";
import ListAppointments from "./pages/Appointments/ListAppointments.vue";
import UserList from "./pages/Users/UserList.vue";
import UpdateProfile from "./pages/Profile/UpdateProfile.vue";
import UpdateSettings from "./pages/Settings/UpdateSettings.vue";

export default [
    {
        path: "/admin/dashboard",
        name: "admin.dashboard",
        component: Dashboard,
    },
    {
        path: "/admin/appointments",
        name: "admin.appointments",
        component: ListAppointments,
    },
    {
        path: "/admin/users",
        name: "admin.users",
        component: UserList,
    },
    {
        path: "/admin/profile",
        name: "admin.profile",
        component: UpdateProfile,
    },
    {
        path: "/admin/settings",
        name: "admin.settings",
        component: UpdateSettings,
    },
];
