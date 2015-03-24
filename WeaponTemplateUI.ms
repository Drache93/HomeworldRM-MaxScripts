try (destroyDialog ::rol_MyPanel) catch()

rollout rol_MyPanel "Homeworld Templates"


(

--rollout subRollout1 "Ship Templates" ( )
SubRollout theSubrollout "Subrollout" height:650
)
rollout roll1 "Ship Templates"(
	
	 label lbl_A "Select the mesh before clicking the button."
	--button btn7 "Ship LOD0(Selection)" width:100 height:18
	button btn7 "LOD0" across:2  width:100 height:18 align:#left
	button btn9 "LOD1"  width:100 height:18 align:#right
	button btn10 "LOD2"  width:100 height:18 across:2 align:#left
	button btn11 "LOD3"  width:100 height:18 align:#right
	button btn12 "Collision Meshes"  width:120 height:18 
	spinner spn_X "X Pos" range:[-1000,1000,0] type:#float
		spinner spn_Y "Y Pos" range:[-1000,1000,0] type:#float
		spinner spn_Z "Z Pos" range:[-1000,1000,0] type:#float
		spinner spn_XRot "X Rot" range:[-360,360,0] type:#float
		spinner spn_YRot "Y Rot" range:[-360,360,0] type:#float
		spinner spn_ZRot "Z Rot" range:[-360,360,0] type:#float
	
	
	
	on btn7 pressed do
	(
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
		
		shipTemplate0 orgName coord:pos rot:euler
		
	)
	
	on btn9 pressed do
	(
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
		--print("Le nom de la selection:" + selection[1].name)
		shipTemplate1 orgName coord:pos rot:euler
		
	)
	
	on btn10 pressed do
	(
	
		
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
						
		shipTemplate2 orgName coord:pos rot:euler		
	)
	
	on btn11 pressed do
	(
	
		
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
						
		shipTemplate3 orgName coord:pos rot:euler		
	)
	
	on btn12 pressed do
	(
	
		
		orgName = selection[1].name;
		local pos = [spn_X.value, spn_Y.value, spn_Z.value]
		local euler = eulerAngles spn_XRot.value spn_YRot.value spn_ZRot.value
		prefixVar = ""
						
		shipTemplate4 orgName coord:pos rot:euler		
	)



)



rollout roll2 "Joint Templates"(

	

	group "Templates:"
    (
        button btn1 "Weapon" across:2 width:100 height:18 align:#left
		button btn2 "Weapon Turret" width:100 height:18 align:#right
		button btn3 "Repair Point" width:100 height:18 across:2 align:#left
		button btn4 "Capture Point" width:100 height:18 align:#right
		button btn5 "Salvage Point" width:100 height:18 across:2 align:#left
		button btn6 "Hardpoint" width:100 height:18 align:#right
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
)	
	
rollout roll3 "NavLight"(	
	
	
	
	group "NavLight:"
	(
	button btn8 "NavLight" width:100 height:18
	edittext edt_B "NavLight Name"
	edittext edt_C "Section            " 
	edittext edt_D "Size                 "
	edittext edt_E "Phase              "
	edittext edt_F "Frequency       "
	dropdownlist ddl_A "Style" items:#("default","nav_baynf","nav_bays","nav_bridge","nav_missile","nav_scaffold","nav_thrust")
	edittext edt_G "Distance"
	--colorpicker theColor "Color RGB:" color:[100,150,180] modal:false
	edittext edt_H "Colour R"
	edittext edt_I "Colour G"
	edittext edt_J "Colour B"
	checkbox chk_A "Visible sprite"
	
	 
	
	
	
	 on edt_C changed text do
    (
		 SectionVar = edt_C.text
    )
	 on edt_D changed text do
    (
		 SizeVar = edt_D.text
    )
	 on edt_E changed text do
    (
		 PhaseVar = edt_E.text
    )
	 on edt_F changed text do
    (
		 FrequencyVar = edt_F.text
    )
	 on edt_G changed text do
    (
		 DistanceVar = edt_G.text
    )
	 on edt_H changed text do
    (
		 ColourRVar = edt_H.text
    )
	 on edt_I changed text do
    (
		 ColourGVar = edt_I.text
    )
	 on edt_J changed text do
    (
		 ColourBVar = edt_J.text
    )
   
    on ddl_A selected sel do
     (
        --print ("The selection number was:" + sel as string)
        --print ("The selected text was:" + ddl_A.selected)
		StyleVar = ddl_A.selected
    )

	on chk_A changed state do
    (
        --print ("the state of the checkbox is:" + state as string)
		if (chk_A.state == true) then
		(
		SpriteVar = "_Flags[Sprite]"
		)
		else
		(
		if (chk_A.state == false) then
		SpriteVar = ""
		)
    ) 
	
	)
	
	on btn8 pressed do
    (
		if (edt_B.text == "") then
		(
			messagebox "Insert a name for the NavLight!" title:"Error"
		)
		else
		(
		
		
        navLightTemplate edt_B.text 
		
		SectionVar = edt_C.text
		SizeVar = edt_D.text
		PhaseVar = edt_E.text
		FrequencyVar = edt_F.text
		DistanceVar = edt_G.text
		ColourRVar = edt_H.text
		ColourGVar = edt_I.text
		ColourBVar = edt_J.text
		--StyleVar = ddl_A.selected String 
		)
    )
)

createDialog rol_MyPanel height:650 width:270 pos:[150,200]
AddSubRollout rol_MyPanel.theSubrollout roll1 
AddSubRollout rol_MyPanel.theSubrollout roll2
AddSubRollout rol_MyPanel.theSubrollout roll3

PrefixVar = "first"
SuffixVar = ""

--NavLight Var





SectionVar = "0"
SizeVar = "10"
PhaseVar = "0"
FrequencyVar = "1"
DistanceVar = "0"
ColourRVar = "1"
ColourGVar = "1"
ColourBVar = "1"
StyleVar = "default"
SpriteVar = ""
		
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

function createDummy2 _name coord suffix:'suffixVar' prefix:'prefixVar' =
(
	local d= dummy()
	d.boxSize = [1,1,1]
	d.name = _name
	d.pos = coord
	
	d
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
	local dMuz = createDummy _name (coord+[0,3,3]) suffix:"_Muzzle"
	
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

--ROOT_LOD

lod0Var = "ROOT_LOD[0]"
lod1Var = "ROOT_LOD[1]"
lod2Var = "ROOT_LOD[2]"
lod3Var = "ROOT_LOD[3]"
cmVar = "ROOT_COL"

function shipTemplate0 _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dRoot = createDummy2 lod0Var coord
	local dJoint = createDummy _name coord
	selection[1].name = "MULT[" + _name + "]_LOD[0]"
	
	append dRoot.children dJoint
	append dJoint.children selection[1]
	
	rotate dRoot rot
	rotate dJoint rot
	
	dJoint
	dRoot
)

function shipTemplate1 _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	local dRoot = createDummy2 lod1Var coord
	selection[1].name = "MULT[" + _name + "]_LOD[1]"
	
	append dRoot.children selection[1]
		
	rotate dRoot rot
	
	dRoot
)

function shipTemplate2 _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	
	local dRoot = createDummy2 lod2Var coord
	selection[1].name = "MULT[" + _name + "]_LOD[2]"
	
	append dRoot.children selection[1]
		
	rotate dRoot rot
	
	dRoot
)

function shipTemplate3 _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	
	local dRoot = createDummy2 lod3Var coord
	selection[1].name = "MULT[" + _name + "]_LOD[3]"
	
	append dRoot.children selection[1]
		
	rotate dRoot rot
	
	dRoot
)

function shipTemplate4 _name coord:[0,0,0] rot:(eulerAngles 0 0 0) =
(
	
	local dRoot = createDummy2 cmVar coord
	selection[1].name = "COL[Root]"
	
	append dRoot.children selection[1]
		
	rotate dRoot rot
	
	dRoot
)




-- Function for NavLight


function NavName _name =
(
	local s = "NAVL[NavLight" + _name + "]_Type[" + StyleVar + "]_Sect[" + SectionVar + "]_Sz[" + SizeVar + "]_Ph[" + PhaseVar + "]_Fr[" + FrequencyVar + "]_Col[" + ColourRVar + "," + ColourGVar + "," + ColourBVar + "]_Dist[" + DistanceVar + "]" + SpriteVar
	s
)

function createSphere _name  =
(
	local rad = 16
	s = sphere()
	s.name = NavName _name 
	s.radius = 10
	
	s
)

function navLightTemplate _name =
(
	local dPos = createSphere _name
	
	dPos
)

