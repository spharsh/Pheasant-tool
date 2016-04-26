about <- tabPanel("About",
  HTML(
    '<p style="text-align:justify">This R Shiny web application presents scoring and recommendation for managing pheasant habitat in townships of South Dakota,USA.
    The scores are calculated on basis of values of certain parameters essential for survival of pheasant like percentage of grassland, cropland, winter crop, shelterbelts etc.</p>
    <p style="text-align:justify">Recommendations are also available. Depending on the score and situation of a township, different recommendations has been provided for a better management of habitat.
     <a href="https://uasnap.shinyapps.io/cc4liteFinal/">Recommendations in township R app</a>.</p>

    <h4>Additional Features</h4>
    <ul>
    <li>% of grassland.</li>
    <li>Upload a custom shapefile to mask map layer in a the upload window.</li>
    <li>Visually confirm your original shapefile and reprojected (if applicable) shapefile on the map look right.</li>
    <li>The uploader compares your shapefile with the app data to ensure validity.</li>
    <li>Shapefiles may contain points, lines, or polygons.</li>
    <li>Combine crop and mask operations.</li>
    <li>Use the color swatches to select from common color palettes or create your own.</li>
    <li>Download the displayed map as a geotiff.</li>
    <li>Disable tooltips if you don\'t need them.</li>
    </ul>
    '
  ),
  
  fluidRow(
    column(3, actionButton("btn_help_rnps", "More About RNPs", class="btn-block"), br()),
    column(3, actionButton("btn_help_mgmt", "About recommendations", class="btn-block"), br())
  ),
  bsModal("modal_help_rcps", "Ring Necked Pheasants", "btn_help_rnps", size="large",
    HTML('
      <p style="text-align:justify">Ring-necked pheasants are native to China and East Asia, but they have been successfully introduced in other parts of the world, including North America.

         Males are vibrantly colored with blue-green heads, red face wattles, and distinctive white neck rings. Females are a rather plain buff brown, but both sexes have long, pointed tails. These beautiful birds are wily in the wild and much sought after by game hunters. Thousands of them are harvested each year, but management and reintroduction programs boost many populations.
         
         Males (also known as "cocks") establish harems of hens-as many as a dozen female birds. Each spring a male delineates and defends his territory and his harem from aggressive rivals. Such encounters can lead to vicious battles.
         
         The birds prefer fields and farmlands with brushy cover, though they also inhabit woodland undergrowth and some wetlands. Females nest in fields or in border habitat and lay a dozen or more eggs, which they incubate with no help from the cock. Young pheasants grow up quickly and can fly within two weeks. They will remain with their mother for six or seven weeks. Many pheasant eggs are destroyed by predators or by humans (particularly in farm country), and young birds also have a high mortality rate..</p>

     
      More information on these species can be found in the SDGFP Report.'
    )
  ),
  bsModal("modal_help_locs", "Recommendations", "btn_help_mgmt", size="large",
    HTML('
      <p style="text-align:justify"> <a href="https://uasnap.shinyapps.io/cc4liteFinal/"></a>.
      </p>

      <p style="text-align:justify">In autumn, ring-necked pheasants form flocks in which they will live until the following spring.

         These birds are most comfortable on the ground, where they forage for grains, seeds, berries, insects, and, occasionally, small animals. They can fly and launch themselves airborne with an abrupt, noisy takeoff, but typically run from trouble. Pheasant flights are merely short-distance dashes for cover.</p>'
    )
  ),
  
  fluidRow(
    column(4,
      HTML('<h5>References</h5>
        <p></p>
        </ul>
        
        </ul>')
      )
   ),
 value="about"
)
