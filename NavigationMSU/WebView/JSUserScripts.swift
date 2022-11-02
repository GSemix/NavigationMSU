//
//  JSUserScripts.swift
//  3DMap
//
//  Created by Семен Безгин on 06.08.2022.
//

import Foundation

let pressPlus = """
var elems = document.getElementById("img");

function Plus() {
    elems.style.width = '500px';
};

Plus();
"""

let pressMinus = """
var elems = document.getElementById("img");

function Minus() {
    elems.style.width = '150px';
};

Minus();
"""

let rich = """
document.getElementById("clicks").innerHTML = 55555;
"""

let getHeaderTitle  = """
function getHeaderTitle() {
    const headerTitle = document.querySelector('h1.title');
    return headerTitle.innerText;
}
getHeaderTitle();
"""

let hideHeaderTitle = """
function hideHeaderTitle() {
    const headerTitle = document.querySelector('h1.title');
    headerTitle.style.display = 'none';
}
hideHeaderTitle();
"""

// use this block with  callAsyncJavaScript  //
let hideAnyElement  = """
    const element = document.querySelector(selector);
    element.style.display = 'none';
"""

let getElementInnerText = """
    const element = document.querySelector(selector);
    return element.innerText;
"""

let setTimeoutFor = """
    const myPromise = new Promise((resolve, reject) => {
        window.setTimeout(() => {
          resolve('foo');
        }, timeout);
      });
    
     await myPromise;
     return myPromise;
"""

let test = """
    var button = document.querySelector(selector);
      button.addEventListener("click", function() {
            document.getElementById("demo").innerHTML = "Hello World";
      });
"""
