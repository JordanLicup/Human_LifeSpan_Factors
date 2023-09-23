Select * from Lifespan_Factors_Analysis..LiveLongerData;

/*Filtering for non-suggestive factors*/
Select Factor, [strength of science?], [Years gained / lost], [sexes affected], effect, Comment, Note
from Lifespan_Factors_Analysis..LiveLongerData
where [strength of science?] = 'strong' or [strength of science?] = 'good';

/*Extracting % and count information from data of non-suggestive factors: Percentages that make up the total amount of factors data set*/
Select COUNT([strength of science?])
as 'Count of Strong and Good Science'
from Lifespan_Factors_Analysis..LiveLongerData
where [strength of science?] = 'strong' or [strength of science?] = 'good';
      
DECLARE @CountOfTotal as FLOAT
DECLARE @CountOfFIltered as FLOAT
DECLARE @PercentageOfWhole as FLOAT
DECLARE @PercentageOfRemaining as FLOAT
SET @CountOfTotal = 35
SET @CountOfFIltered = 17
SET @PercentageOfWhole = @CountOfFIltered/@CountOfTotal * 100
SET @PercentageOfRemaining = 100 - @PercentageOfWhole
Print @PercentageOfWhole
Print @PercentageOfRemaining

Select Factor, effect
from Lifespan_Factors_Analysis..LiveLongerData
where [effect] = 'positive' and [strength of science?] = 'strong' 
or [effect] = 'positive' and [strength of science?] = 'good';

Select COUNT([effect])
as 'Count of Negative effects'
from Lifespan_Factors_Analysis..LiveLongerData
where [effect] = 'negative' and [strength of science?] = 'strong' 
or [effect] = 'negative' and [strength of science?] = 'good';

/*Bellow is for % Non-suggestive Positive Factors*/
DECLARE @CountOfTotal2 as FLOAT
DECLARE @CountOfFiltered2 as FLOAT
DECLARE @PercentageOfWhole2 as FLOAT
DECLARE @PercentageOfRemaining2 as FLOAT
SET @CountOfTotal2 = 35
SET @CountOfFiltered2 = 12
SET @PercentageOfWhole2 = @CountOfFiltered2/@CountOfTotal2 * 100
SET @PercentageOfRemaining2 = 100 - @PercentageOfWhole2
Print @PercentageOfWhole2
Print @PercentageOfRemaining2
/*Bellow is for % Non-suggestive Negative Factors*/
DECLARE @CountOfTotal3 as FLOAT
DECLARE @CountOfFiltered3 as FLOAT
DECLARE @PercentageOfWhole3 as FLOAT
DECLARE @PercentageOfRemaining3 as FLOAT
SET @CountOfTotal3 = 35
SET @CountOfFiltered3 = 5
SET @PercentageOfWhole3 = @CountOfFiltered3/@CountOfTotal3* 100
SET @PercentageOfRemaining3 = 100 - @PercentageOfWhole3
Print @PercentageOfWhole3
Print @PercentageOfRemaining3

/*AVG Effect of non-suggestive factors, separated by effect*/
Select AVG([Years gained / lost]) from Lifespan_Factors_Analysis..LiveLongerData
where effect = 'positive' and [strength of science?] = 'strong'
or effect = 'positive' and [strength of science?] = 'good';

Select AVG([Years gained / lost]) from Lifespan_Factors_Analysis..LiveLongerData
where effect = 'negative' and [strength of science?] = 'strong'
or effect = 'negative' and [strength of science?] = 'good';

/*Ranking of most positive and negative effecting factors with strong or good supported science*/
Select * from Lifespan_Factors_Analysis..LiveLongerData
where [strength of science as a number] >= 2 and [effect] = 'positive'
ORDER BY [Years gained / lost] DESC;

Select * from Lifespan_Factors_Analysis..LiveLongerData
where [strength of science as a number] >= 2 and [effect] = 'negative'
ORDER BY [Years gained / lost];

/*Queries for Cleaning the data, as there where contradicting parts of the data,
where the effect was positive yet the number of years from that affect was a negative and vice versa.*/
Select * from Lifespan_Factors_Analysis..LiveLongerData
where [Years gained / lost] < 0 and [effect] = 'positive'
ORDER BY [Years gained / lost] DESC;

Select * from Lifespan_Factors_Analysis..LiveLongerData
where [Years gained / lost] > 0 and [effect] = 'negative'
ORDER BY [Years gained / lost] DESC;