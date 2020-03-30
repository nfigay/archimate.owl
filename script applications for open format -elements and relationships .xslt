
<xsl:stylesheet version="3.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:xml= "http://www.w3.org/XML/1998/namespace"
exclude-result-prefixes="#all"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:owl="http://www.w3.org/2002/07/owl#"  
xmlns:archimate="http://www.plm-interop.net/archimate/" 
xpath-default-namespace="http://www.opengroup.org/xsd/archimate/3.0/">

<xsl:param name="myRDFNameSpace" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#'"/>
<xsl:param name="myOWLNameSpace" select="'http://www.w3.org/2002/07/owl#'"/>
<xsl:param name="myArchiMateNameSpace" select="'http://www.plm-interop.net/archimate/'"/>
<xsl:param name="myXMLNameSpace" select="'http://www.w3.org/XML/1998/namespace'"/>
<xsl:param name="myXSDNameSpace" select="'http://www.w3.org/2001/XMLSchema#'"/>
<xsl:param name="myRDFSNameSpace" select="'http://www.w3.org/2000/01/rdf-schema#'"/>


<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" exclude-result-prefixes="#all" />

<xsl:template match="/">
<xsl:element name="rdf:RDF">

    <xsl:namespace name="owl"> <xsl:value-of select="$myOWLNameSpace"/></xsl:namespace>     
    <xsl:namespace name="rdf"> <xsl:value-of select="$myRDFNameSpace"/></xsl:namespace>
     <xsl:namespace name="xml"> <xsl:value-of select="$myXMLNameSpace"/></xsl:namespace>
     <xsl:namespace name="archimate"> <xsl:value-of select="$myArchiMateNameSpace"/></xsl:namespace>
     <xsl:namespace name="xsd"> <xsl:value-of select="$myXSDNameSpace"/></xsl:namespace>
     <xsl:namespace name="rdfs"> <xsl:value-of select="$myRDFSNameSpace"/></xsl:namespace>
     <xsl:call-template name="Import"/>
     <xsl:call-template name="Elements"/>
     <xsl:call-template name="Relationships"/>
</xsl:element>
</xsl:template>

<xsl:template name="Import" match="/model">
    <xsl:variable name="myBase" select="//model/@identifier"/>
    <owl:Ontology rdf:about="http://www.plm-interop.net/ArchiMate/InteroperabilityTesting/{$myBase}#">
        <owl:imports rdf:resource="http://www.plm-interop.net/archimate/3.0"/>
    </owl:Ontology>
</xsl:template>

<xsl:template name="Elements" match="model/elements/element">
    <xsl:for-each select="model/elements/element">
       <xsl:element name="owl:NameIndividual">
            <xsl:attribute name="rdf:about">
                <xsl:value-of select="concat('http://www.plm-interop.net/ArchiMate/InteroperabilityTesting/',//model/@identifier,'/',./@identifier)"/>     
            </xsl:attribute>
            <xsl:element name="rdf:type"> <xsl:attribute name="rdf:resource"><xsl:value-of select="concat('http://www.plm-interop.net/archimate/',./@xsi:type)" /></xsl:attribute></xsl:element>
        </xsl:element>
    </xsl:for-each>    
</xsl:template>

<xsl:template name="Relationships" match="model/elements/relationship">
    <xsl:for-each select="model/relationships/relationship">
       <xsl:element name="owl:NameIndividual">
            <xsl:attribute name="rdf:about">  
             <xsl:value-of select="concat('http://www.plm-interop.net/ArchiMate/InteroperabilityTesting/',//model/@identifier,'/',./@identifier)"/>  
            </xsl:attribute>
            <xsl:element name="rdf:type"><xsl:attribute name="rdf:resource">
                 <xsl:value-of select="concat('http://www.plm-interop.net/archimate/',./@xsi:type)"/></xsl:attribute></xsl:element>
            <xsl:variable name="mySourceType" select="./@xsi:type"/>
            <xsl:element name="archimate:SourceRelationshipFor{$mySourceType}"> 
                 <xsl:attribute name="rdf:resource">
                     <xsl:value-of select="concat('http://www.plm-interop.net/ArchiMate/InteroperabilityTesting/',//model/@identifier,'/',./@source)"/>  </xsl:attribute></xsl:element>            
            <xsl:element name="archimate:TargetRelationshipFor{$mySourceType}">
                 <xsl:attribute name="rdf:resource">
                     <xsl:value-of select="concat('http://www.plm-interop.net/ArchiMate/InteroperabilityTesting/',//model/@identifier,'/',./@target)"/></xsl:attribute></xsl:element>    
       </xsl:element>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet> 