// Run in mongosh. Read-only server status snapshot.
const s = db.adminCommand({ serverStatus: 1 });
printjson({ version: s.version, uptimeSeconds: s.uptime,
             connections: s.connections, opcounters: s.opcounters,
             memory: s.mem });
