"use strict";

const nba = require('nba').default;

nba.stats.allPlayers().then(res => {
  console.log(res)
});

