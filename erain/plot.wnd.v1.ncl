;----------------  LOAD LIBRARIES ---------------------------------

; --------------- Load NCL libraries ------------------------------
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

begin
year = 2012
filename="erain.w10."+year+".v1.1deg.nc"
plotname="erain.v10."+year+".v1.1deg"
;-------------------------------------------------------------------

	inp 	= addfile(filename,"r")
	u	= inp->U10M(0,:,:)
	v	= inp->V10M(0,:,:)
        ;print(v(1,1)+"")
        printVarSummary(v)
; ---- set unit
   
	wks  = gsn_open_wks("png",plotname) 

	gsn_define_colormap(wks,"WhiteBlueGreenYellowRed")  

;-------------------------------------------------------------------        

  	res                    	= True  

	res@gsnMaximize		= True
	res@gsnFrame            = False  
	res@gsnDraw             = False     
	res@gsnAddCyclic	= False


;-------------------------------------------------------------------


	res@cnFillOn             	= True                
	res@gsnSpreadColors     	= True  
	;res@gsnSpreadColorStart	= 5

	res@tmXBLabelFontHeightF 	= 0.009
	res@tmYLLabelFontHeightF 	= 0.009

	res@cnLinesOn           	= False
	;res@cnLineColor		= "White"
	;;res@cnLevelSelectionMode 	= "ExplicitLevels"       
	;;res@cnLevels             	= ispan(2,20,2)

        res@cnLineLabelsOn          = False
;-------------------------------------------------------------------

	res@mpOutlineOn               	= True              
 	res@mpFillOn                  	= False             
 	res@mpGridAndLimbOn             = False
 	res@mpPerimOn                   = True  

	res@mpNationalLineColor         = "gray"
	
	;res@mpDataSetName              = "Earth..4"   
 	;res@mpDataBaseVersion          = "MediumRes" 
	;res@mpOutlineBoundarySets      = "National"

;-------------------------------------------------------------------

	res@lbLabelAutoStride	       	= False
	res@lbLabelFontHeightF         = 0.012
	res@lbTitleFontHeightF         = 0.012
	res@pmLabelBarWidthF           = 0.6
	res@pmLabelBarHeightF          = 0.1
	res@lbTitleString              = "[%]"
	res@pmLabelBarOrthogonalPosF   = 0.05
	res@lbLabelBarOn = False
	res@lbLabelBarOn = True

;-------------------------------------------------------------------

	; --- SH
  	;res@gsnPolar                 = "SH"
	;res@mpMaxLatF                =  -25

	; --- NH
  	res@gsnPolar                 = "NH"
	res@mpMinLatF                =  25


  	res@mpGridAndLimbOn          = True
    

	plot = gsn_csm_contour_map_polar(wks,v,res)
        ;print(num(fronts>2))

;-------------------------------------------------------------------


; --- Advance frame
 maximize_output(wks,True)   
end
