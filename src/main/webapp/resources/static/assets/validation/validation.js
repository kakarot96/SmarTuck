function checkSelectBox()
{
	var functionElements = document.forms["loginform"].elements;

    var selectedValue = functionElements[0].value;

    if(selectedValue == "employee")
    {
        document.getElementById('name-header15-1').setAttribute("pattern", "[Aa]{1}[0-9]{6}$");
        document.getElementById('name-header15-1').setAttribute("title", "Must contain A followed by 6 digits");
    }
    else if(selectedValue == "shopkeeper")
    {
        document.getElementById('name-header15-1').setAttribute("pattern", "[sS]{1}[0-9]{6}$");
        document.getElementById('name-header15-1').setAttribute("title", "Must contain S followed by 6 digits");
    }
}


