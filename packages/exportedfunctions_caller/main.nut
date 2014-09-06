function TestExportedFunctions(pkg, cmd)
{
	exportedPkg <- Package.Find("exportedfunctions_callee");

	exportedPkg.CallFunction("ExportedFunction", 0, 1);
	exportedPkg.CallFunction("ExportedFunction2", 0, 1, 2, 3);
	exportedPkg.CallFunction("ExportedFunction3");
}
Event.Add(Package, "start", TestExportedFunctions);