<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Weather Forecast</title>
            </head>
            <body>
                <h1>Weather Forecast</h1>
                <table border="1">
                    <tr>
                        <th>From</th>
                        <th>To</th>
                        <th>Temperature (°C)</th>
                        <th>Wind Direction</th>
                        <th>Wind Speed (mps)</th>
                        <th>Humidity (%)</th>
                        <th>Pressure (hPa)</th>
                        <th>Cloudiness (%)</th>
                        <th>Precipitation (mm)</th>
                        <th>Symbol</th>
                    </tr>
                    <xsl:for-each select="weatherdata/product/time">
                        <tr>
                            <td><xsl:value-of select="@from"/></td>
                            <td><xsl:value-of select="@to"/></td>
                            <td><xsl:value-of select="location/temperature/@value"/></td>
                            <td><xsl:value-of select="location/windDirection/@name"/></td>
                            <td><xsl:value-of select="location/windSpeed/@mps"/></td>
                            <td><xsl:value-of select="location/humidity/@value"/></td>
                            <td><xsl:value-of select="location/pressure/@value"/></td>
                            <td><xsl:value-of select="location/cloudiness/@percent"/></td>
                            <td><xsl:value-of select="location/precipitation/@value"/></td>
                            <td><xsl:value-of select="location/symbol/@id"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    </xsl:stylesheet>
