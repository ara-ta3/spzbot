// Description:
//   Misc
// Commands:
//   hubot meshi {members} - {members}を2グループに分ける


function shuffle(array) {
    for(let i = array.length - 1; i > 0; i--){
        const r = Math.floor(Math.random() * (i + 1));
        const tmp = array[i];
        array[i] = array[r];
        array[r] = tmp;
    }
    return array;
}

module.exports = (robot) => {
    robot.respond(/meshi (.*)$/i, (msg) => {
        const members = msg.match[1].split(/\s+/);
        const n = members.length;
        const shuffled = shuffle(members);
        const teamA = shuffled.slice(0, n/2);
        const teamB = shuffled.slice(n/2, n);
        msg.send(`A: ${teamA.join(", ")}\nB: ${teamB.join(", ")}`);
    });
};
