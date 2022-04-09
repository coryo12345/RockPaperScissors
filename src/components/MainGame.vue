<script setup lang="ts">
import { ref } from "vue";
import RoundButton from "./RoundButton.vue";
import PlayableGame from "./PlayableGame.vue";

const inGame = ref(false);

function startGame() {
  inGame.value = true;
}
</script>

<template>
  <h1 :class="{ center: true, pivot: inGame }">Rock Paper Scissors</h1>
  <!-- <div :class="{ spacer: inGame }"></div> -->
  <RoundButton v-if="!inGame" label="Play Game" @click="startGame" />
  <div v-else>
    <PlayableGame class="show" />
  </div>
</template>

<style scoped lang="scss">
$fade-time: 1s;

h1 {
  font-size: 4em;
  color: white;
}

.center {
  margin-top: 40vh;
}

.pivot {
  margin-top: 0.5em;
  transition: all $fade-time;
}

.show {
  animation-duration: 2 * $fade-time;
  animation-name: fade-in;
}

@keyframes fade-in {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
</style>
