"use strict";(self.webpackChunkwebsite=self.webpackChunkwebsite||[]).push([[674],{9882:(e,t,o)=>{o.r(t),o.d(t,{contentTitle:()=>s,default:()=>g,frontMatter:()=>a,metadata:()=>r,toc:()=>l});var n=o(7462),i=(o(7294),o(3905));const a={sidebar_position:1},s="Commuting Zones Overview",r={unversionedId:"Methodology/CZMethodology",id:"Methodology/CZMethodology",isDocsHomePage:!1,title:"Commuting Zones Overview",description:"---",source:"@site/docs/Methodology/CZMethodology.md",sourceDirName:"Methodology",slug:"/Methodology/CZMethodology",permalink:"/CommutingZones/docs/Methodology/CZMethodology",editUrl:"https://github.com/facebookincubator/CommutingZones/docs/Methodology/CZMethodology.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"tutorialSidebar",previous:{title:"Getting Started with Commuting Zones",permalink:"/CommutingZones/docs/GettingStarted/Installation"},next:{title:"Commuting Zones Walkthrough",permalink:"/CommutingZones/docs/Walkthrough/Walkthrough"}},l=[],c={toc:l},h="wrapper";function g(e){let{components:t,...a}=e;return(0,i.kt)(h,(0,n.Z)({},c,a,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",{id:"commuting-zones-overview"},"Commuting Zones Overview"),(0,i.kt)("hr",null),(0,i.kt)("p",null,"Our commuting zones are rebuilt every three months using aggregated estimates of home and work locations. Only users who opt-in to sharing their location data with Facebook are included. For each continent, we build a graph that connects population centers within the continent and cluster these locations."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},(0,i.kt)("a",{parentName:"strong",href:"https://www.facebook.com/help/278928889350358"},"Facebook Location Services"))),(0,i.kt)("p",null,(0,i.kt)("img",{alt:"World Map",src:o(6579).Z})),(0,i.kt)("p",null,"In these graphs, population centers represent the nodes. The edges (connections) between these nodes have a weight. We construct this weight using weekday home and work locations over the previous few weeks using the following formula:"),(0,i.kt)("p",null,(0,i.kt)("img",{alt:"Formula",src:o(8044).Z})),(0,i.kt)("p",null,(0,i.kt)("img",{alt:"Transit",src:o(1548).Z})),(0,i.kt)("p",null,"With this formula, the weights that connect nodes always range from 0 to 1. When we construct this graph, there can be connections between very distant places on opposite ends of a continent. Since our current algorithm does not formally take distance into account, including very distant locations adds noise to our graph. To mitigate this noise, we remove connections that are in the 95th percentile or above in the distribution of distances."),(0,i.kt)("p",null,"To build commuting zones:"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"We extract community structure from the graphs constructed above using the Louvain algorithm."),(0,i.kt)("li",{parentName:"ol"},"We impose a hierarchical structure by taking the resulting clusters and partitioning them once more with the Louvain algorithm. For each location, we build Voronoi shapes around their centroids."),(0,i.kt)("li",{parentName:"ol"},"We then create overall shapes on a map by merging all spatial areas associated with the same commuting zone.")),(0,i.kt)("p",null,"This is an active area of research and we are still developing and improving on our methodology to generate these zones."),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},(0,i.kt)("a",{parentName:"strong",href:"https://iopscience.iop.org/article/10.1088/1742-5468/2008/10/P10008?fbclid=IwAR0IdjoRwAwGBFFgfwl8lVUAPyafgrBfF95-zS0i2myuBHmOospCYepFKLA"},"Louvain Algorithm"))),(0,i.kt)("p",null,(0,i.kt)("strong",{parentName:"p"},(0,i.kt)("a",{parentName:"strong",href:"https://en.wikipedia.org/wiki/Voronoi_diagram?fbclid=IwAR2cH2nC5zM0na7VcpXIUpZnykI8KLLLY2O19IdVaVIQdeqe5JT9F-Okcds"},"Voronoi Shapes"))),(0,i.kt)("p",null,(0,i.kt)("img",{alt:"Commuting Zones in North America",src:o(8570).Z})),(0,i.kt)("p",null,"This map illustrates commuting zones for the United States."))}g.isMDXComponent=!0},6579:(e,t,o)=>{o.d(t,{Z:()=>n});const n=o.p+"assets/images/cz_methodology_1-0c04d97fb60311da17fa14dc67c478f0.png"},8044:(e,t,o)=>{o.d(t,{Z:()=>n});const n=o.p+"assets/images/cz_methodology_2-36e7b67065e71e987811099bf6fc5ffc.png"},1548:(e,t,o)=>{o.d(t,{Z:()=>n});const n=o.p+"assets/images/cz_methodology_3-b973081f414a88a671347fb36837cef1.png"},8570:(e,t,o)=>{o.d(t,{Z:()=>n});const n=o.p+"assets/images/cz_methodology_4-8f3db90b05e1e22e0e08b3b9d7835ae5.png"}}]);