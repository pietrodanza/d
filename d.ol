include "console.iol"

interface dInterface {
RequestResponse:
  identification(string)(string)
OneWay:
}

interface eInterface {
RequestResponse: identification(string)(string)
OneWay:
}

execution{concurrent}

inputPort dIn {
Location: JDEP_LOCATION_d_dIn
Protocol: sodep
Interfaces: dInterface
}

outputPort eOut {
Location: JDEP_LOCATION_d_eOut
Protocol: sodep
Interfaces: eInterface
}

main
{

  [identification(request)(response){
    request = request + " D ";
    identification@eOut(request)(response);
    println@Console( request )()
  }]
}
