<script setup>
defineProps({
    loading: {
        type: Boolean,
        default: false,
        required: true,
    },
});
</script>

<template>
    <!-- Preloader -->
    <div class="wrapper">
        <div
            v-if="loading"
            class="preloader flex-column justify-content-center align-items-center"
        >
            <div class="loader"></div>
            <!-- <img
                class="animation__shake"
                src="https://adminlte.io/docs/3.2/assets/img/AdminLTELogo.png"
                alt="AdminLTELogo"
                height="60"
                width="60"
            /> -->
        </div>
    </div>
    <!-- Preloader -->
</template>

<style>
.preloader {
    background-color: black;
    opacity: 95%;
}
/* HTML: <div class="loader"></div> */
.loader {
    width: 30px;
    aspect-ratio: 1;
    background: #554236;
    display: grid;
    transform-origin: top right;
    animation: l6-0 1s infinite linear;
}
.loader::before,
.loader::after {
    content: "";
    grid-area: 1/1;
    background: #256ee4;
    transform-origin: inherit;
    animation: inherit;
    animation-name: l6-1;
}
.loader::after {
    background: #60b99a;
    --s: 180deg;
}
@keyframes l6-0 {
    70%,
    100% {
        transform: rotate(360deg);
    }
}
@keyframes l6-1 {
    30% {
        transform: rotate(var(--s, 90deg));
    }
    70% {
        transform: rotate(0);
    }
}
</style>
