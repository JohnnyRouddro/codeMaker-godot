# codeMaker-godot
Just a small alphanumeric code maker to create in-app coupons in you Godot app.

Click the "Make" button to create the codes and "Save" button to save them in godot's dictionary(or json) format.

Example: "Make" button creates a random code such as 1234ABCD1234ABCD which is saved as is inside the codes.txt file and as {"_1234ABCD1234ABCD":false} in dictionary.txt, simple as that. All files are in "res://" directory.

You can use the dictionary to make codes for your game/app and release the codes later. When an user redeems a code, you could turn it's value to "true". I only made 16 digit alphanumeric codes for sample. You can do whatever you want with this, good luck!

I added a windows executable inside CodeMaker.zip
