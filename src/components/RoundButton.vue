<script lang="ts" setup>
const props = defineProps<{
  label: string;
}>();

const emit = defineEmits<{
  (e: "click", event: Event): void;
}>();

function clickFunc(event: Event) {
  emit("click", event);
}
</script>

<template>
  <button @click="clickFunc">
    {{ props.label }}
  </button>
</template>

<style lang="scss" scoped>
$pad: 0.5em;
$size: 2em;

button {
  padding: $pad;
  font-size: $size;
  border-radius: calc(2 * $pad + $size);
  border: 4px solid white;
  background: transparent;
  color: white;
  font-weight: bolder;
  width: max-content;
}

button:hover {
  cursor: pointer;
  background-color: #ffffff44;
}

button:active {
  transform: scale(0.95);
}
</style>
