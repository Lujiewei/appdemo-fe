import { defineStore } from "pinia";

export const useCounterStore = defineStore("storeId", {
  state: () => {
    return { counte: 0 };
  },
  getters: {
    double: (state) => {
      return state.counte++;
    },
  },
  actions: {
    increment() {
      this.counte++;
    },
  },
});
