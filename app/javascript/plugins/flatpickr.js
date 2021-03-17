import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initRangePickr = () => {
  flatpickr("#range_start", {
    altInput: true,
    "enableTime": true,
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initRangePickr };
