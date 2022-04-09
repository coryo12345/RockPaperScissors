<script setup lang="ts">
import MainGame from "./components/MainGame.vue";
</script>

<template>
  <MainGame />
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  /* color: #2c3e50; */
  color: white;
  height: 100%;
}

body {
  background: rgb(226, 228, 0);
  background: linear-gradient(
    223deg,
    rgba(226, 228, 0, 1) 0%,
    rgba(194, 83, 195, 1) 45%,
    rgba(249, 255, 0, 1) 100%
  );
  margin: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}
</style>
