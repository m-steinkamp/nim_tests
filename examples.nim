import random

randomize(123)


### How do tuples look like in C? Like structs!
echo "--- tuples test ---"

func tuplesTest(name: string): tuple[answer: string, goodName: bool] =
    if name == "":
        return ("Poor soul, you lost your name?", false)
    elif name == "name":
        return ("Very funny, your name is name.", false)
    else:
        return ("Hi " & name & "!", true)

echo "What's your name? "
let (answer, goodName) = tuplesTest(readLine(stdin))
echo answer
echo "Was a good name? ", if goodName: "yes" else: "no"


#[
    ### Try some "declarative programming style" like I have seen in flutter.

    https://pub.dev/documentation/eva/latest/eva/Response/maybeMatch.html
    Response<SomeClass> response;
    final newResponse = response.map<String>(
        success: (someClassInstance) => Response.success(someClassInstance.someStringProperty),
    );
]#
echo "--- declarative style test ---"

type ResponseKind = enum
    responseValue, responseException

type Response = ref object
    case kind: ResponseKind
    of responseValue: value: int # todo: generic type!
    of responseException: exception: string

proc maybeMatch(response: Response, success: proc (value: int), failure: proc(exception: string)) = # todo: optional parameters?
    case response.kind
    of responseValue: success(response.value)
    of responseException: failure(response.exception)


proc useCaseCodeReturningResponse(): Response =
    # simulating lower level code called, resulting in either succesful value or potential exception
    if rand(1) == 1:
        Response(kind: responseValue, value: 1337)
    else:
        Response(kind: responseException, exception: "Caught some runtime exception!")

proc success(value: int) =
    echo "Success: ", value

proc failure(exception: string) =
    echo "Failure: ", exception

for i in 0..4:
    useCaseCodeReturningResponse().maybeMatch(success, failure) # todo: inline closures possible?
