{
  "spriteId": {
    "name": "sSpaceshipSmall",
    "path": "sprites/sSpaceshipSmall/sSpaceshipSmall.yy",
  },
  "solid": false,
  "visible": true,
  "managed": true,
  "spriteMaskId": null,
  "persistent": true,
  "parentObjectId": {
    "name": "oShip",
    "path": "objects/oShip/oShip.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":2,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":64,"eventType":8,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":4,"eventType":7,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":3,"value":"True","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"alive","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"50","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"weight","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1 - 0.1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"dragPercent","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"variable_name","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":2,"value":"DEFAULT","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"ship_name","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"oShip","path":"objects/oShip/oShip.yy",},"objectId":{"name":"oShip","path":"objects/oShip/oShip.yy",},"value":"$FF00FF00","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"maxSpeed","path":"objects/oShip/oShip.yy",},"objectId":{"name":"oShip","path":"objects/oShip/oShip.yy",},"value":"5","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"oShip","path":"objects/oShip/oShip.yy",},"objectId":{"name":"oShip","path":"objects/oShip/oShip.yy",},"value":"50","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"hp","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"50","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"healthbarColor","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"$FF00FF00","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"team","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"TEAM.FRIENDLY","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"mass","path":"objects/pShootable/pShootable.yy",},"objectId":{"name":"pShootable","path":"objects/pShootable/pShootable.yy",},"value":"50","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Ships",
    "path": "folders/Objects/Ships.yy",
  },
  "resourceVersion": "1.0",
  "name": "oPlayer",
  "tags": [],
  "resourceType": "GMObject",
}