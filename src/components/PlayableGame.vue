<script setup lang="ts">
import { ref } from "vue";
import RoundButton from "./RoundButton.vue";

const FADE_TIME = 1 * 1000;

const options = ref(["✊", "✋", "✌️"]);
const chosen = ref(false);
const cpuChoice = ref("");
const status = ref("");

const statuses = {
  win: "You Win",
  tie: "You Tie",
  lose: "You Lose",
};

const gameModel = {
  "✊": {
    "✊": statuses.tie,
    "✋": statuses.lose,
    "✌️": statuses.win,
  },
  "✋": {
    "✊": statuses.win,
    "✋": statuses.tie,
    "✌️": statuses.lose,
  },
  "✌️": {
    "✊": statuses.lose,
    "✋": statuses.win,
    "✌️": statuses.tie,
  },
};

function choose(choice: string) {
  cpuChoice.value =
    options.value[Math.floor(Math.random() * options.value.length)];
  chosen.value = true;

  status.value = (gameModel as any)[choice][cpuChoice.value];
}

const tempFade = ref(false);
function retry() {
  tempFade.value = true;
  // wait 1 second for all to be hidden
  setTimeout(() => {
    chosen.value = false;
    tempFade.value = false;
  }, FADE_TIME);
}
</script>

<template>
  <div :class="{ centered: true, 'temp-fade': tempFade }">
    <!-- choose option -->
    <div :class="{ stage1: chosen, stage: true }">
      <h2>Choose:</h2>
      <div class="row">
        <span
          v-for="option in options"
          :key="option"
          @click="
            () => {
              choose(option);
            }
          "
          class="clickable large"
        >
          {{ option }}
        </span>
      </div>
    </div>
    <!-- CPU choose -->
    <div :class="{ stage2: chosen, hide: !chosen, stage: true }">
      <div>
        <h2>Opponent Chose:</h2>
        <span class="large">{{ cpuChoice }}</span>
      </div>
      <div>
        <h2>{{ status }}</h2>
      </div>
      <!-- Replay -->
      <div class="retry">
        <RoundButton label="Play Again" @click="retry" />
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">
$fade-time: 1s;

.centered {
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
}

.row {
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.clickable {
  cursor: pointer;
}
.clickable:hover {
  transition: all 0.2s;
  transform: scale(1.1);
}

.large {
  display: inline-block;
  font-size: 10rem;
  margin: 0 1rem;
}

@media screen and (max-width: 650px) {
  .large {
    font-size: 25vw;
  }
}

.stage {
  position: absolute;
  top: 0;
  width: 100%;
}

.stage1 {
  animation-name: fade-out;
  animation-duration: $fade-time;
  opacity: 0;
  visibility: hidden;
}

.stage2 {
  animation-name: fade-in;
  animation-duration: calc(2 * $fade-time);
  opacity: 1;
}
.hide {
  display: none;
}

@keyframes fade-out {
  0% {
    opacity: 1;
    visibility: visible;
  }
  99% {
    visibility: visible;
  }
  100% {
    opacity: 0;
    visibility: hidden;
  }
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

.retry {
  margin-top: 4em;
  width: 100%;
}

.temp-fade {
  opacity: 0;
  transition: all $fade-time;
}
</style>
