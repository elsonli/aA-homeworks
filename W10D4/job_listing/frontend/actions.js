const selectLocation = (cityStr, jobsArr) => (
  {
    type: "SWITCH_LOCATION",
    city: cityStr,
    jobs: jobsArr
  }
)

window.selectLocation = selectLocation

export default selectLocation;