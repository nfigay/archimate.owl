#!/usr/bin/perl
@ArchiMateModelingEntities = ("Business_Actor", "Business_Collaboration", "Business_Event", "Business_Function", "Business_Interaction", "Business_Interface","Business_Object", "Business_Process", "Contract", "Business_Role", "Business_Service", "Product", "Representation", "Application_Collaboration", "Application_Component", "Application_Event", "Application_Function", "Application_Interaction", "Application_Interface", "Application_Process", "Application_Service", "Data_Object", "Deliverable", "Gap", "Implementation_Event", "Plateau", "Work_Package", "Assessment", "Driver", "Goal", "Meaning", "Outcome", "Principle", "Requirement", "Constraint", "Stakeholder", "Value", "Grouping", "Junction", "Location", "Capability", "Course_of_Action", "Resource", "Artifact", "Communication_Network", "Device", "Distribution_Network", "Equipment", "Facility", "Material", "Node", "Path", "System_Software", "Technology_Collaboration", "Technology_Event", "Technology_Function", "Technology_Interaction", "Technology_Interface" , "Technology_Process", "Technology_Service", "Technology_Object");

@ArchiMateModelingRelations=("Access", "Influence", "Serving", "Flow", "Triggering", "Association", "Specialization", "Aggregation", "Assignment", "Composition", "Realization");
open(DATA, ">TestDataSet.txt") or die "Couldn't open file TestDataSet.txt, $!";
foreach (@ArchiMateModelingEntities) {
print DATA "$_\n";
}
close DATA;


# This will print "Hello, World"
print "Hello, world\n";