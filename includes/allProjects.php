<?php
require './connect.php';


$query = 
'SELECT 
	projects.*,
    GROUP_CONCAT(DISTINCT tools.name) as tools,
    GROUP_CONCAT(DISTINCT types.name) as types,
    GROUP_CONCAT(DISTINCT images.image_path) as images,
    GROUP_CONCAT(DISTINCT f_type.type) as f_type
  
FROM tbl_projects as projects
LEFT JOIN tbl_linking_project_tools as ptools
	ON ptools.project_id = projects.id
LEFT JOIN tbl_tools as tools
	ON ptools.tool_id = tools.id
LEFT JOIN tbl_linking_project_type as ptypes
	ON ptypes.project_id = projects.id
LEFT JOIN tbl_types as types
	ON ptypes.type_id = types.id
LEFT JOIN tbl_slider_images as images
	ON images.project_id = projects.id
LEFT JOIN tbl_featured_type as f_type
	ON f_type.id = projects.feature_type
GROUP BY projects.id';

$stmt = $pdo->prepare($query);

$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($results);

