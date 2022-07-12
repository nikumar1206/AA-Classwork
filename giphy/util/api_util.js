const apiKEY = "C6POIpO2QV5uP3VeZFJmQi6bXDuFjPWq";
export const fetchSearchGiphys = (searchterm) =>
  $.ajax({
    url: `http://api.giphy.com/v1/gifs/search?q=${searchterm}&api_key=${apiKEY}&limit=2`,
    method: "GET",
  });
