<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <!-- CSV Header -->
        <xsl:text>From,To,Temperature (°C),Wind Direction,Wind Speed (mps),Humidity (%),Pressure (hPa),Cloudiness (%),Precipitation (mm),Symbol</xsl:text>
        <xsl:text>&#10;</xsl:text> <!-- New line -->

        <!-- CSV Data Rows -->
        <xsl:for-each select="weatherdata/product/time">
            <xsl:value-of select="@from"/><xsl:text>,</xsl:text>
            <xsl:value-of select="@to"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/temperature/@value"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/windDirection/@name"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/windSpeed/@mps"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/humidity/@value"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/pressure/@value"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/cloudiness/@percent"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/precipitation/@value"/><xsl:text>,</xsl:text>
            <xsl:value-of select="location/symbol/@id"/>
            <xsl:text>&#10;</xsl:text> <!-- New line -->
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>