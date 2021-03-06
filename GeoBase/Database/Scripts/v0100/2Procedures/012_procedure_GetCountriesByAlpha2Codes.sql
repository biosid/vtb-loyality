IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Geopoints].[GetCountriesByAlpha2Codes]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Geopoints].[GetCountriesByAlpha2Codes]
GO

CREATE PROCEDURE [Geopoints].[GetCountriesByAlpha2Codes]
(	
    @codes NVARCHAR(3000)
)
AS
BEGIN
	DECLARE @xml XML 
	SELECT @xml = CAST('<A>'+ REPLACE(@codes,',','</A><A>')+ '</A>' AS XML)
	
	;WITH input
	AS (
		SELECT tmp.value('.', 'char(2)') AS Code
		FROM @xml.nodes('/A') AS x(tmp)
	)
	SELECT c.* 
	FROM [Geopoints].[OKSMCountries] c
	INNER JOIN input ON input.Code = c.[Alpha2Code]
END
GO

/* TEST select all
DECLARE	@return_value int

EXEC	[Geopoints].[GetCountriesByAlpha2Codes]
		@codes = N'AB,AD,AE,AF,AG,AI,AL,AM,AO,AQ,AR,AS,AT,AU,AW,AZ,BA,BB,BD,BE,BF,BG,BH,BI,BJ,BL,BM,BN,BO,BQ,BR,BS,BT,BV,BW,BY,BZ,CA,CC,CD,CF,CG,CH,CI,CK,CL,CM,CN,CO,CR,CU,CV,CW,CX,CY,CZ,DE,DJ,DK,DM,DO,DZ,EC,EE,EG,EH,ER,ES,ET,FI,FJ,FK,FM,FO,FR,GA,GB,GD,GE,GF,GG,GH,GI,GL,GM,GN,GP,GQ,GR,GS,GT,GU,GW,GY,HK,HM,HN,HR,HT,HU,ID,IE,IL,IM,IN,IO,IQ,IR,IS,IT,JE,JM,JO,JP,KE,KG,KH,KI,KM,KN,KP,KR,KW,KY,KZ,LA,LB,LC,LI,LK,LR,LS,LT,LU,LV,LY,MA,MC,MD,ME,MF,MG,MH,MK,ML,MM,MN,MO,MP,MQ,MR,MS,MT,MU,MV,MW,MX,MY,MZ,NA,NC,NE,NF,NG,NI,NL,NO,NP,NR,NU,NZ,OM,OS,PA,PE,PF,PG,PH,PK,PL,PM,PN,PR,PS,PT,PW,PY,QA,RE,RO,RS,RU,RW,SA,SB,SC,SD,SE,SG,SH,SI,SJ,SK,SL,SM,SN,SO,SR,SS,ST,SV,SX,SY,SZ,TC,TD,TF,TG,TH,TJ,TK,TL,TM,TN,TO,TR,TT,TV,TW,TZ,UA,UG,UM,US,UY,UZ,VA,VC,VE,VG,VI,VN,VU,WF,WS,YE,YT,ZA,ZM,ZW,АХ'
*/

