<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="channel">
    &lt;!--#set var=&quot;pageTitle&quot; value=&quot;LFS Project Homepage&quot; --&gt;
    &lt;!--#include virtual=&quot;header.html&quot; --&gt;
    &lt;!--#include virtual=&quot;menu.html&quot; --&gt;
    <div class="main">
    <h1><xsl:value-of select="title"/></h1>
    <xsl:for-each select="item">
      <h2><xsl:value-of select="title"/></h2>
      <p><xsl:value-of select="description"/></p>
    </xsl:for-each>
    </div>
    &lt;!--#include virtual=&quot;/common/footer.html&quot; --&gt;
  </xsl:template>
</xsl:stylesheet>
