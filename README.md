# Nature-Chemisty-2022-Structure-specific-amyloid-precipitation-in-biofluids

Description of files:

### ImageJ

1. Average projection for each field of view (typically 27), crop stack and define noise threshold. 
2. Run ThT macros (same used by everyone)  
3. Generates a x y list, 'fluorescence intensity of individual aggregates vs field of view'.  
 
### Matlab

1. '1 - GenerateIndividualSummary' (uses another code ‘uipickfiles’)  
2. '1.1 - Uipickfiles'  
3. Generates one file per sample containing x and y position, raw intensity, background, and intensity-background for each aggregate 
4. '2 - CompileSummariesplots'
5. Generates a single file for all samples containing the average 'number of aggregates per um2' of each sample. 

