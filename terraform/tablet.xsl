<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="node()|@*">
      <xsl:copy>
         <xsl:apply-templates select="node()|@*"/>
      </xsl:copy>
   </xsl:template>

  <xsl:template match="/domain/devices">
    <xsl:copy>
        <xsl:apply-templates select="node()|@*"/>
            <xsl:element name ="input">
                <xsl:attribute name="type">tablet</xsl:attribute>
                <xsl:attribute name="bus">usb</xsl:attribute>
                <xsl:element name="alias">
                    <xsl:attribute name="name">input0</xsl:attribute>
                </xsl:element>
                <xsl:element name="address">
                    <xsl:attribute name="type">usb</xsl:attribute>
                    <xsl:attribute name="bus">0</xsl:attribute>
                    <xsl:attribute name="port">1</xsl:attribute>
                </xsl:element>
            </xsl:element>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>
