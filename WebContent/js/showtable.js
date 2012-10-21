// JavaScript Document


function showtable(tableid)
{
whichtable=eval("table"+tableid);
if(whichtable.style.display=="none")
{eval("table"+tableid+".style.display=\"\";");}
else
{eval("table"+tableid+".style.display=\"none\";");}
}