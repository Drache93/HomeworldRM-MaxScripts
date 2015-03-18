try (destroyDialog ::rol_MyPanel) catch()
 
rollout rol_MyPanel "Homeworld Templates"
(

	

	group "Templates:"
    (
        button btn1 "Weapon" width:100 height:18
		button btn2 "Weapon Turret" width:100 height:18
		button btn3 "Repair Point" width:100 height:18
		button btn4 "Capture Point" width:100 height:18
		button btn5 "Salvage Point" width:100 height:18
		button btn6 "Hardpoint" width:100 height:18
		button btn7 "Ship (Selection)" width:100 height:18
		edittext edt_A "Joint Name"
		spinner spn_X "X Pos" range:[-1000,1000,0] type:#float
		spinner spn_Y "Y Pos" range:[-1000,1000,0] type:#float
		spinner spn_Z "Z Pos" range:[-1000,1000,0] type:#float
		spinner spn_XRot "X Rot" range:[-360,360,0] type:#float
		spinner spn_YRot "Y Rot" range:[-360,360,0] type:#float
		spinner spn_ZRot "Z Rot" range:[-360,360,0] type:#float
		
		
		
    )
	
    on btn1 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "Weapon_"
		suffixVar = "_Position"
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        weaponTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn2 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "Weapon_"
		suffixVar = "_Position"
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        weaponturretTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn3 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "RepairPoint"
		suffixVar = ""
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        repairTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn4 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "CapturePoint"
		suffixVar = ""
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        repairTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn5 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "SalvagePoint"
		suffixVar = ""
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        repairTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn6 pressed do
    (
		if (edt_A.text == "") then
		(
			messagebox "Insert a name for the joint!" title:"Error"
		)
		else
		(
		prefixVar = "Hardpoint_"
		suffixVar = "_Position"
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
        weaponTemplate edt_A.text coord:pos rot:euler
		)
    )
	
	on btn7 pressed do
	(
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
		
		shipTemplate orgName coord:pos rot:euler
		
	)
)
createDialog rol_MyPanel height:340 width:300 pos:[150,200]

PrefixVar = "first"
SuffixVar = ""
		
function jointName _name suffix prefix:("Weapon")=
(
	local s = "JNT[" + prefix + _name + suffix + "]"
	s
)

function createDummy _name coord suffix:'suffixVar' prefix:'prefixVar' =
(
	local d= dummy()
	d.boxSize = [1,1,1]
	d.name = jointName _name suffix prefix:prefix
	d.pos = coord
	
	d
)

function shipTemplate _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dJoint = createDummy _name coord
	selection[1].name = "MULT[" + _name + "]"
	
	append dJoint.children selection[1]
	
	rotate dJoint rot
	
	dJoint
)

function weaponTemplate _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dPos = createDummy _name coord
	local dDir = createDummy _name (coord+[0,1,0]) suffix:"_Direction"
	local dRest = createDummy _name (coord+[0,0,1]) suffix:"_Rest"
	
	append dPos.children dDir
	append dPos.children dRest
	
	rotate dPos rot
	
	dPos
)

function weaponturretTemplate _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dPos = createDummy _name coord
	local dDir = createDummy _name (coord+[0,1,0]) suffix:"_Direction"
	local dRest = createDummy _name (coord+[0,0,1]) suffix:"_Rest"
	local dLat = createDummy _name (coord+[0,3,0]) suffix:"_Latitude"
	local dMuz = createDummy _name (coord+[0,0,3]) suffix:"_Muzzle"
	
	append dPos.children dDir
	append dPos.children dRest
	append dPos.children dLat
	
	append dLat.children dMuz
	
	rotate dPos rot
	
	dPos
)

function repairTemplate _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dPos = createDummy _name coord
	local dHead = createDummy _name (coord+[0,0,1]) suffix:"Heading"
	local dLeft = createDummy _name (coord+[1,0,0]) suffix:"Left"
	local dUp = createDummy _name (coord+[0,1,0]) suffix:"Up"
	
	append dPos.children dHead
	append dPos.children dLeft
	append dPos.children dUp
	
	rotate dPos rot
	
	dPos
)