// Replica-set status; standalone deployments will return an error.
const r = db.adminCommand({ replSetGetStatus: 1 });
printjson({ set: r.set, myState: r.myState,
  members: (r.members || []).map(m => ({
    name: m.name, stateStr: m.stateStr, health: m.health, optimeDate: m.optimeDate
  }))
});
