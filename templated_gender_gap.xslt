<svg width='430' height='380' version="1.1" xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:xsl='http://www.w3.org/1999/XSL/Transform' xsl:version='1.1'>

    <!-- ================== Define project specific variables, these are just examples from the gender pay collection ====================== -->
    <!-- EXAMPLE: <xsl:variable name='name' select='/row/value[@colname="Name"]'/> -->
    
    
    <!-- Define your column data -->
    <xsl:variable name='name' select='/row/value[@colname="Name"]'/>
    <xsl:variable name='gender' select='/row/value[@colname="Gender"]'/>
    <xsl:variable name='salary' select='/row/value[@colname="Salary"]'/>
    <xsl:variable name='title' select='/row/value[@colname="Title"]'/>
    <xsl:variable name='imgName' select='/row/value[@colname="Image Name"]'/>
    
    <!-- Define the image URL -->
    <xsl:variable name='baseImageURL'>https://storage.googleapis.com/zegami-edge/zegs/gender-salaries/</xsl:variable>
    
    <xsl:variable name='portraitURL'>
        <xsl:value-of select='$baseImageURL'/>portraits/<xsl:value-of select='$imgName'/>
    </xsl:variable>
    
    
    <!-- ===================== Select which variables are going to be used in the relevant template areas ================================== -->
    <!-- EXAMPLE: <xsl:variable name='titleText'><xsl:value-of select='$name'/></xsl:variable> -->
    <!-- NOTE: If using less than all of these fields, leave the relevant fields blank instead of having an xsl:value-of or TITLE_TEXT -->
    
    
    <!-- Present in all sizes -->
    <xsl:variable name='titleText'><xsl:value-of select='$name'/></xsl:variable>
    <xsl:variable name='mainImgURL'><xsl:value-of select='$portraitURL'/></xsl:variable>
    
    <!-- Medium panel features -->
    <xsl:variable name='buttonTitleText'></xsl:variable>
    <xsl:variable name='buttonMainText'>
        <xsl:choose>
            <xsl:when test='$gender = "Male"'>♂</xsl:when>
            <xsl:otherwise>♀</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <!-- Large panel details -->
    <xsl:variable name='detailTitle0'>Gender</xsl:variable>
    <xsl:variable name='detailContent0'><xsl:value-of select='$gender'/></xsl:variable>
    
    <xsl:variable name='detailTitle1'>Salary</xsl:variable>
    <xsl:variable name='detailContent1'><xsl:value-of select='$salary'/></xsl:variable>
    
    <xsl:variable name='detailTitle2'></xsl:variable>
    <xsl:variable name='detailContent2'></xsl:variable>
    
    <xsl:variable name='detailTitle3'></xsl:variable>
    <xsl:variable name='detailContent3'></xsl:variable>
    
    
    <!-- =================================== Select the color scheme (found on our Zeplin) ================================================= -->
    
    
    <xsl:variable name='colorDark'>
        <xsl:choose>
            <xsl:when test='$gender = "Male"'>#01265b</xsl:when>
            <xsl:otherwise>#71185c</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name='colorMid'>
        <xsl:choose>
            <xsl:when test='$gender = "Male"'>#09519c</xsl:when>
            <xsl:otherwise>#a36d97</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name='colorLight'>
        <xsl:choose>
            <xsl:when test='$gender = "Male"'>#9ecae1</xsl:when>
            <xsl:otherwise>#ceb5c8</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:variable name='colorLightest'>
        <xsl:choose>
            <xsl:when test='$gender = "Male"'>#e0ecf7</xsl:when>
            <xsl:otherwise>#eae4e9</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    
    <!-- =================================================================================================================================== -->
    
    
    <!-- Set the global colors -->
    <xsl:variable name='textTitleColor'>#ffffff</xsl:variable>
    <xsl:variable name='textDetailTitleColor'>#909399</xsl:variable>

    
    <!-- Get the size class of the panel -->
    <xsl:variable name='panelSize' select='/row/@size'/>
    

    <!-- Create panel based on size -->
    <g font-family='sans-serif' letter-spacing='0.6' text-anchor='middle' alignment-baseline='central'>
    
        <rect width='430' height='380' fill='{$colorLightest}'/>
        
        <xsl:choose>
        
            <!-- Small panel -->
            <xsl:when test='$panelSize = "small"'>
                
                <!-- Upper panel -->
                <rect x='21' y='19' width='388' height='90' fill='{$colorDark}'/>
                <text x='215' y='75' width='69' height='30' font-size='28' font-weight='bold' fill='{$textTitleColor}'>
                    <xsl:value-of select='$titleText'/>
                </text>
                
                <!-- Lower panel -->
                <rect x='21' y='111' width='388' height='250' fill='{$colorLight}'/>
                <image x='21' y='111' width='388' height='250' preserveAspectRatio='true' xlink:href='{$mainImgURL}'/>
                
            </xsl:when>
    
    
    
            <!-- Medium panel -->
            <xsl:when test='$panelSize = "medium"'>
                
                <!-- Upper panel -->
                <rect x='21' y='19' width='298' height='90' fill='{$colorDark}'/>
                <text x='170' y='75' width='69' height='30' font-size='28' font-weight='bold' fill='{$textTitleColor}'>
                    <xsl:value-of select='$titleText'/>
                </text>
                
                <!-- Lower panel -->
                <rect x='21' y='111' width='298' height='250' fill='{$colorLight}'/>
                <image x='21' y='111' width='298' height='250' preserveAspectRatio='true' xlink:href='{$mainImgURL}'/>
                
                <!-- Circle label -->
                <circle cx='320' cy='235' r='47' fill='{$colorDark}'/>
                
                <!-- Title -->
                <text x='320' y='210' font-size='16' font-weight='bold' fill='{$textTitleColor}'>
                    <xsl:value-of select='$buttonTitleText'/>
                </text>
                
                <!-- Value -->
                <text x='320' y='245' font-size='42' font-weight='bold' fill='{$textTitleColor}'>
                    <xsl:value-of select='$buttonMainText'/>
                </text>
                    
            </xsl:when>
    
    
    
            <!-- Large panel (otherwise) -->
            <xsl:otherwise>
                
                <!-- Upper panel -->
                <rect x='21' y='19' width='250' height='90' fill='{$colorDark}'/>
                <text x='146' y='75' width='69' height='30' font-size='28' font-weight='bold' fill='{$textTitleColor}'>
                    <xsl:value-of select='$titleText'/>
                </text>
                
                <!-- Lower panel -->
                <rect x='21' y='111' width='250' height='250' fill='{$colorLight}'/>
                <image x='21' y='111' width='250' height='250' preserveAspectRatio='true' xlink:href='{$mainImgURL}'/>
                
                
                <!-- Detail 0 -->
                <text x='347' y='37' width='115' height='25' font-size='15' font-weight='bold' fill='{$textDetailTitleColor}'>
                    <xsl:value-of select='$detailTitle0'/>
                </text>
                <text x='347' y='70' width='115' height='45' font-size='25' font-weight='bold' fill='{$colorDark}'>
                    <xsl:value-of select='$detailContent0'/>
                </text>
                
                
                <!-- Detail 1 -->
                <text x='347' y='127' width='115' height='25' font-size='15' font-weight='bold' fill='{$textDetailTitleColor}'>
                    <xsl:value-of select='$detailTitle1'/>
                </text>
                <text x='347' y='160' width='115' height='45' font-size='25' font-weight='bold' fill='{$colorDark}'>
                    <xsl:value-of select='$detailContent1'/>
                </text>
                
                
                <!-- Detail 2 -->
                <text x='347' y='217' width='115' height='25' font-size='15' font-weight='bold' fill='{$textDetailTitleColor}'>
                    <xsl:value-of select='$detailTitle2'/>
                </text>
                <text x='347' y='250' width='115' height='45' font-size='25' font-weight='bold' fill='{$colorDark}'>
                    <xsl:value-of select='$detailContent2'/>
                </text>
                
                
                <!-- Detail 3 -->
                <text x='347' y='307' width='115' height='25' font-size='15' font-weight='bold' fill='{$textDetailTitleColor}'>
                    <xsl:value-of select='$detailTitle3'/>
                </text>
                <text x='347' y='340' width='115' height='45' font-size='25' font-weight='bold' fill='{$colorDark}'>
                    <xsl:value-of select='$detailContent3'/>
                </text>
                    
            </xsl:otherwise>
            
        </xsl:choose>
    </g>

</svg>