{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "oShieldBubble",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":12,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":2,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":1,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"propertyId":{"name":"shieldHPColor","path":"objects/pShootable/pShootable.yy",},"value":"$FFFFFF00",},
  ],
  "parent": {
    "name": "Actives",
    "path": "folders/Objects/Modules/Actives.yy",
  },
  "parentObjectId": {
    "name": "pShootable",
    "path": "objects/pShootable/pShootable.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"shieldHPColorDepleted","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"$FF0000FF","varType":7,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"duration","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"300","varType":0,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"scale","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"1.0","varType":0,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_smp_shield_loop",
    "path": "sprites/spr_smp_shield_loop/spr_smp_shield_loop.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}