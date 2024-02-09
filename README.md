# Boston-AirBNB-Analysis
### Exploration of the Boston Metro AirBNB Market using data from [Inside AirBNB](http://insideairbnb.com/get-the-data/)

R was used to explore publically available data on the Boston Metro AirBNB market provided by [Inside AirBNB](http://insideairbnb.com/get-the-data/). The following datasets were used in the analysis [reviews](https://drive.google.com/file/d/1iap4VukUPFmdJuhwS-Fm1tZUkrYXiWL9/view?usp=sharing), [listing](https://drive.google.com/file/d/1q12VZOt1mWXoNxZSRscgrRFT4ffav6JT/view?usp=sharing), and [calendar](https://drive.google.com/file/d/1j-f03kFHLY1m9RZJAv6kXmRxYBJMWXMz/view?usp=sharing).
In the exploratory data analysis phase an interesting pricing trend was discovered showing that Average AirBNB prices were driven heavily by weekends and specific events. The event with the highest impact on AirBNB pricing in Boston is the running of the Boston Marathon on Patriots Day, a holiday almost exclusively celebrated within the state of Massachusetts.
<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/EDA_Pricing.png?raw=true"></p>
While further exploring the data I wanted to get a better understanding of AirBNB hosts that have multiple units available to rent on the platform. The most common number of units goes in the expected order of 1 being most common, 2, 3, 4... however there are more hosts operating 10+ AirBNBs than there are hosts operating 5 thru 10 AirBNBs. This points to an observable trend of many AirBNBs being registered to property management companies that are leveraging AirBNB as a booking application.
<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/Multi_Unit_in_Boston.png?raw=true"></p>
To gain a better understanding of which features are most important in determining the price of a night in an AirBNB a Random Forest was used. Based on that feature analysis a cluster model was built to generate 5 distinct clusters of AirBNBs based on their attributes.
<p align="center"><img src="<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/Final_Clust_Elbow.png?raw=true"></p>
<p align="center"><img src="<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/BNB_clust.png"></p>
Using the clusters as tags on the dataset of AirBNB listings descriptive statistics can be used to gain a better understanding of the features of each cluster and what makes them distinctive.
<p align="center"><img src="<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/GT_Final_Clust.png?raw=true"></p>
Finally the AirBNBs were spatially plotted in Tableau to show where AirBNBs of each type can be found throughout Boston and to assess any geographic patterns within the data.
<p align="center"><img src="<p align="center"><img src="https://github.com/evanjconnolly/Boston-AirBNB-Analysis/blob/main/final_cluster_map.jpg?raw=true"></p>



