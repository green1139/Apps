//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var age = arc4random_uniform(10)

var num = 16

var isPrime = true

if (num == 1)
{
    isPrime = false
}

for (var i = 2; i < num; i++)
{
    if (num%i == 0)
    {
        isPrime = false
        break
    }
}

if (isPrime)
{
    print("\(num) is Prime.")
}
    
else
{
    print("\(num) is not Prime.")
}

var myNewDictArray = [["title":String(), "subtitle":String()]]
myNewDictArray[0]["title"] = "Science"
myNewDictArray[0]["subtitle"] = "First"
myNewDictArray.append(["title": "Math", "subtitle":"Second"])
var dict = myNewDictArray[1]
print(dict)


var subjects = [["subject":String(), "red":Int(), "blue":Int(), "green":Int()]]
if (NSUserDefaults.standardUserDefaults().objectForKey("subjects") != nil)
{
    subjects = NSUserDefaults.standardUserDefaults().objectForKey("subjects") as! [NSDictionary]
}
else
{
    subjects.removeAll()
    NSUserDefaults.standardUserDefaults().setObject(subjects, forKey: "subjects")
}

let myString = "1~ These are how updates will show up on your app. __ "
((myString.componentsSeparatedByString("~ "))[1].componentsSeparatedByString(" __"))[0]
let arrayofStr = ["Siddhant ",""]
let striing = arrayofStr[0]
(striing.componentsSeparatedByString(" "))[0]