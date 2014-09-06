/*
 *		MultIV Simple DM
 *	@file: Utility.nut
 *	@author: Jan Christophersen
 *     
 *	@license: see "LICENSE" at root directory
 */

Utility <- {};

function Utility::ColorToString (c)
{
	return format("#%x", c);
}

function Utility::Implode (v, strDelimiter = " ")
{
   if (typeof v != "array" && typeof v != "table")
      return "";

    local strTemp = "";
    foreach (i, val in v)
    {
            strTemp += val + strDelimiter
    }
    return strTemp.slice(0, strTemp.len() - strDelimiter.len());
}

function Utility::IsNumeric(v)
{
	if (typeof v != "string")
		return false;

	return regexp("\\d{1,}(.\\d){0,1}\\d*").match(v);
}
