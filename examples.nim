proc checkName(name: string): tuple[answer: string, goodName: bool] =
    if name == "":
        return ("Poor soul, you lost your name?", false)
    elif name == "name":
        return ("Very funny, your name is name.", false)
    else:
        return ("Hi " & name & "!", true)


echo "What's your name? "
var name: string = readLine(stdin)
let (answer, goodName) = checkName(name)
echo answer
echo "Was a good name? ", if goodName: "yes" else: "no"
