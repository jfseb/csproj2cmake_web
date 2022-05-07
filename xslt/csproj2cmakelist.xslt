<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:mp="http://schemas.sap.com/sfsf/aa/mp"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:s="http://schemas.microsoft.com/developer/msbuild/2003"
   xmlns="http://schemas.microsoft.com/developer/msbuild/2003"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl mp xsl"
>
  <xsl:output method="xml" omit-xml-declaration="no" encoding="utf-8" indent="yes"/>
  <!-- dot directions fact table West -->
  <xsl:param name="DIR_IN" select="':e'"></xsl:param>
  <xsl:param name="DIR_OUT" select="':w'"></xsl:param>

  <xsl:variable name="FACTTABLENAME" select="//FactTable/@id"></xsl:variable>
  <xsl:variable name="FACTTABLEFINNAME" select="concat(//FactTable/@id,'FIN')"></xsl:variable>
  <!-- ********************************* -->
  <xsl:template name="Compiles">
    <COMPILES id="COMPILES">
      <xsl:for-each select="//s:Compile[@Include]">
        <COMPILE Value="{@Include}"/>
       </xsl:for-each>
    </COMPILES>
  </xsl:template>
  <!-- ********************************* -->

  <xsl:template name="ProjectReferences">
      <ProjectReferences id="ProjectReferences">
        <xsl:for-each select="//s:ProjectReference">
        <ProjectReference value="{@Include}" Name="{s:Name}"/>
        </xsl:for-each>
      </ProjectReferences>
    </xsl:template>

  <!-- ********************************* -->


  <xsl:template name="References">
      <References id="References">
        <xsl:for-each select="//s:Reference">
         <Reference value="{@Include}" HintPath="{s:HintPath}"/>
        </xsl:for-each>
      </References>
    </xsl:template>

  <!-- ********************************* -->

  <xsl:template name="Content">
      <Contents id="Content">
        <xsl:for-each select="//s:Content">
        <Content value="{@Include}"/>
        </xsl:for-each>
      </Contents>
    </xsl:template>

  <!-- ********************************* -->
<!-- embedded resource /Generator /SubType-->

  <xsl:template match="/">
  <RESULT>
    <!--
    <xsl:for-each select="child::*">
    <xsl:value-of select="."/>
  </xsl:for-each> -->



    <NAME id="NAME" value="{//s:PropertyGroup/s:AssemblyName[1]/text()}"></NAME>
    <TYPE id="TYPE" value="{//s:PropertyGroup/s:OutputType[1]}"/>
    <xsl:call-template name="Compiles"/>
    <xsl:call-template name="ProjectReferences"/>
    <xsl:call-template name="References"/>
    <xsl:call-template name="Content"/>
  </RESULT>
  </xsl:template>
  <!-- ********************************* -->

</xsl:stylesheet>