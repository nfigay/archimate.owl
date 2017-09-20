#!/usr/bin/perl
@ArchiMateModelingEntities = ("Business_Actor", "Business_Collaboration", "Business_Event", "Business_Function", "Business_Interaction", "Business_Interface","Business_Object", "Business_Process", "Contract", "Business_Role", "Business_Service", "Product", "Representation", "Application_Collaboration", "Application_Component", "Application_Event", "Application_Function", "Application_Interaction", "Application_Interface", "Application_Process", "Application_Service", "Data_Object", "Deliverable", "Gap", "Implementation_Event", "Plateau", "Work_Package", "Assessment", "Driver", "Goal", "Meaning", "Outcome", "Principle", "Requirement", "Constraint", "Stakeholder", "Value", "Grouping", "Junction", "Location", "Capability", "Course_of_Action", "Resource", "Artifact", "Communication_Network", "Device", "Distribution_Network", "Equipment", "Facility", "Material", "Node", "Path", "System_Software", "Technology_Collaboration", "Technology_Event", "Technology_Function", "Technology_Interaction", "Technology_Interface" , "Technology_Process", "Technology_Service", "Technology_Object");

@ArchiMateModelingRelations=("Access", "Influence", "Serving", "Flow", "Triggering", "Association", "Specialization", "Aggregation", "Assignment", "Composition", "Realization");
open(DATA, ">TestDataSet.txt") or die "Couldn't open file TestDataSet.txt, $!";
@n=("001", "002", "003");

for my $i (0.. $#ArchiMateModelingEntities) {

   for my $j (0.. $#n){
print DATA "$Entity\n", '<!-- http://www.plminterop.org/archimate/' , $ArchiMateModelingEntities[$i] , '_G', $n[$j],"  -->\n\n",
'<owl:NamedIndividual rdf:about="http://www.plminterop.org/archimate/',
$ArchiMateModelingEntities[$i] , '_G', $n[$j], '">',"\n",
'   <rdf:type rdf:resource="http://www.plminterop.org/archimate/',
$ArchiMateModelingEntities[$i] ,'"','/','>',"\n",
'</owl:NamedIndividual>' , "\n\n" ;   

};};

for my $i (0.. $#ArchiMateModelingRelations) {
   for my $j (0.. $#ArchiMateModelingEntities) {
print DATA   
   
"<!-- http://www.plminterop.org/archimate/", $ArchiMateModelingRelations[$i],"_AB",$j, "_", $ArchiMateModelingEntities[$j],"_001_002", "-->",
"\n","\n",
'<owl:NamedIndividual rdf:about="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'_AB',$j,"_",$ArchiMateModelingEntities[$j],"_001_002",'">',"\n",
'      <rdf:type rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'"/>',
"\n",
 "      <SourceRelationshipFor",  $ArchiMateModelingRelations[$i], '  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G001"/>',
 "\n",
'      <TargetRelationshipFor', $ArchiMateModelingRelations[$i],'  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G002"/>',
"\n",
'</owl:NamedIndividual>',
"\n","\n","\n"
;    
};}; 

for my $i (0.. $#ArchiMateModelingRelations) {
   for my $j (0.. $#ArchiMateModelingEntities) {
print DATA   
   
"<!-- http://www.plminterop.org/archimate/", $ArchiMateModelingRelations[$i],"_BC",$j,
"_", $ArchiMateModelingEntities[$j],"_002_003","-->",
"\n","\n",
'<owl:NamedIndividual rdf:about="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'_BC',$j,"_",$ArchiMateModelingEntities[$j],"_002_003",'">',"\n",
'      <rdf:type rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'"/>',
"\n",
 "      <SourceRelationshipFor",  $ArchiMateModelingRelations[$i], '  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G002"/>',
 "\n",
'      <TargetRelationshipFor', $ArchiMateModelingRelations[$i],'  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G003"/>',
"\n",
'</owl:NamedIndividual>',
"\n","\n","\n"
;    
};};  

for my $i (0.. $#ArchiMateModelingRelations) {
   for my $j (0.. $#ArchiMateModelingEntities) {
print DATA   
   
"<!-- http://www.plminterop.org/archimate/", $ArchiMateModelingRelations[$i],"_AA",$j, "_", $ArchiMateModelingEntities[$j],"_001_001","-->",
"\n","\n",
'<owl:NamedIndividual rdf:about="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'_AA',$j,"_",$ArchiMateModelingEntities[$j],"_001_001",'">',"\n",
'      <rdf:type rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingRelations[$i],'"/>',
"\n",
 "      <SourceRelationshipFor",  $ArchiMateModelingRelations[$i], '  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G001"/>',
 "\n",
'      <TargetRelationshipFor', $ArchiMateModelingRelations[$i],'  rdf:resource="http://www.plminterop.org/archimate/',$ArchiMateModelingEntities[$j],'_G001"/>',
"\n",
'</owl:NamedIndividual>',
"\n","\n","\n"
;    
};};  

close DATA;

# This will print "Hello, World"
print "Hello, world\n";