<p align="left" width="100%">
  <img height="56" src="img/logo-ait.png"> &nbsp; &nbsp;
  <img height="56" src="img/eth-sip-3l.png">     
</p>

# Electricity Use, Group 14
#### Alexandre Reol, Bernhard Maennel, Luca Kummer, Marco Wiedner, Nikolaos Kaliorakis, Vivian Ziemke

## Project description

Reducing electricity consumption can be a great challenge for households. The first issue that arises is that of truly becoming aware of the problem. Households might be aware of their overall electricity consumption in kWh or some other electricity-related metric but simultaneously may not really grasp what these numbers mean, how they emerge from their appliances, and what their long-run implications are. Furthermore, even if households are thoroughly informed, aware, and value the concept of energy frugality, there are many reasons that prevent them from acting. These reasons can be traced back to cognitive biases (status quo, risk aversion, social mimicry, etc) and other mechanisms that boundedly rational actors are subject to. Further reasons might be, lack of funding for energy efficient device upgrades, paralysis from many potential alternatives, and difficulties in judging better alternatives. Finally, one’s electricity usage might go far beyond what is immediately evident. For example, actions like video streaming, which lead to the consumption of energy in server farms and storage facilities are responsible for a significant amount of CO2 emissions.

The solutions that we derived, aim to tackle the problems at all the above-mentioned levels. Firstly, informing the user in an intuitive way is of utmost importance. This can be done in several ways: dashboards, visual communication of quantities, interfaces showing historic data and forecasts on the path the user has committed to, abstraction of electricity usage through a virtual pet or forest that need nurturing, delivering vital information through entertaining content, and centralized grouping and curation of relevant sources. Secondly, we believe that we can promote action through incentive schemes, gamified challenges, and innovative financing structures. Weekly challenges with friends and family could utilize the social dynamics towards lowering electricity consumption. Reward programs and virtual currencies could incentivize behavioural change, and crowdsourcing platforms could assist the ones who are in need of funding for energy upgrades. To conclude , we also had some ideas in helping with “unconscious” electricity use. Browser add-ons that analyze internet traffic and web browsing history can be used to estimate the “invisible” electricity consumed. This way, we can make the energy use of our end-users visible by creating their “digital twin”. This concept can be extended to other online actions like showing overall electricity use for the delivery of an e-shop order. By tackling the defined problems at one of these levels, we believe that we can design a platform which  can influence how people consume electricity.

## Ideation

##### How might we?

- inform the user in an intuitive way on his/her electricity consumption?
- get the information to households on how to reduce the energy usage?
- make the end-user aware of their passive and "unconscious" electricity uage?
- incentivize users to invest into making their households more energy efficient?
- make users reduce their electricity consumptions by social gamification?

##### Brainstorming and Affinity Diagram
For brainstorming, we first individually tried to come up with ideas for each how-might-we-statement, and then had a meeting where we discussed / combined our ideas and then made an affinity diagram for each how-might-we-statement. You can see the results in this file: [AffinityDiagram.pdf](/Deliverables/AffinityDiagram/AffinityDiagram.pdf)

## Evaluation

    TODO

## Low-fidelity Prototype

##### Idea A

The main idea is to have a virtual pet/plant represent how good (or bad) the energy consumption of the end-user is. Is the user making progress on reducing his/her consumption or is not consuming excessively more than his neighbourhood, friends, etc, so the pet is doing good (represented by a percentage in the prototype). Is the end-user making bad decisions or is consuming "unnecessary" electricity, so his/her pet will not feel well. The "well-being" of the virtual pet is represented on the home screen of the app.

![](/Deliverables/LowFiPrototyping/IdeaA/Storyboard.jpeg)

|![alt](/Deliverables/LowFiPrototyping/IdeaA/Paper_1.jpeg) |![alt](/Deliverables/LowFiPrototyping/IdeaA/Paper_2.jpeg)|
|-|-|


##### Idea B

The main idea is to have a platform to facilitate people helping each other afford home upgrades which save energy (and potentially money through a lower energy bill) in the long run. To that end, we made a prototype phone-client for both the borrower and the lender.

![](/Deliverables/LowFiPrototyping/IdeaB/ideaB_storyboard.jpg)


|![alt](/Deliverables/LowFiPrototyping/IdeaB/borrowerClient1.jpg) |![alt](/Deliverables/LowFiPrototyping/IdeaB/borrowerClient2.jpg)|
|-|-|
|![alt](/Deliverables/LowFiPrototyping/IdeaB/borrowerClient3.jpg) |![alt](/Deliverables/LowFiPrototyping/IdeaB/borrowerClient4.jpg)|

|![alt](/Deliverables/LowFiPrototyping/IdeaB/lenderClient1.jpg) |![alt](/Deliverables/LowFiPrototyping/IdeaB/lenderClient2.jpg)|![alt](/Deliverables/LowFiPrototyping/IdeaB/lenderClient3.jpg)|
|-|-|-|
|![alt](/Deliverables/LowFiPrototyping/IdeaB/lenderClient4.jpg) | ![alt](/Deliverables/LowFiPrototyping/IdeaB/lenderClient5.jpg)


#### Idea C

![](/Deliverables/LowFiPrototyping/IdeaC/1.png)
![](/Deliverables/LowFiPrototyping/IdeaC/2.png)
![](/Deliverables/LowFiPrototyping/IdeaC/3.png)
![](/Deliverables/LowFiPrototyping/IdeaC/4.png)


## Mid-fidelity Prototype

### Prototype: Electricity Pet

The main idea of this prototype is to link electricity usage with the health of a virtual pet (like tamagochi). The user already has a way to measure electricity consumption via devices like [this kit](https://www.amazon.com/Sense-Energy-Monitor-Electricity-Usage/dp/B075K6PHJ9). The idea is to make the problem from a rational calculation to an emotional task and provide the necessary data in a visually appealing way.

The main screen (Fig.1) shows the pet, the Meter that indicates this week’s consumption and the target, the weekly score, and the evolution of electricity consumption. The colors of the pet indicate its health (a.k.a proximity electricity consumption targets). By pressing the “Details” button one can access an overview of how they consumed electricity (Fig.2). The color scale and the circle size indicate the size of impact each device had on this week’s electricity consumption. A bar chart also shows the devices with the same color code in descending order of consumption. The user can tap on the circles to see more details (Fig.3), as well as tips on how to reduce consumption. In all these screens, by pressing the triangle on the top left, the user can navigate to the previous screen. No screen is more than two steps away from the “Home” screen.  From the “Consumption” (Fig.2) the user can set new goals for the upcoming week (Fig.5) by tapping on the “to-do” squares.

Another possible path is pressing the rectangle with the arrow and percentage from the “Home” screen. This will lead the user to the “Achievements” screen (Fig.4). Here the user can see how he performed with respect to the goals they set for themselves, as well as the streak (consecutive weekly participation) they have. From this screen, the user can navigate to the “Set Goals” screen by pressing the “Set New” button.

A secondary feature that is available from the “Home” screen is accessed by tapping on the “Score”. This shows the user a leaderboard of their “friends”, in order to further motivate the user to reduce consumption.

![](/Deliverables/MidFiPrototyping/pet_summary.png)


### Prototype: Crowdfunding Platform

The idea behind this prototype lies in connecting investors and fundraisers for the task of funding the purchase of new, more efficient, appliances and other energy upgrades. The Fundraisers are people who are aware of their electricity consumption, want to reduce, but currently don’t have the access to the funds for it. Investors are people with an excess of funds that want to help other households reduce their consumption because they are aware that electricity consumption reduction needs a collective approach.

#### Fundraiser’s Side

In Fig 1 one can see the different ongoing projects, and toggle between them with the indicated arrows. The users can also select and start a new project here, by using the provided UI at the bottom of UI. In Fig. 2 one can see the screen when selecting a solution for a new fundraising project. In this example one can choose between different heaters which have their respective cost and electricity savings. Pressing the “i”-Button will lead to further Details about the Project, as one can see the Details in Fig. 4. The user on the Fundrasier Side can also choose between waiting and self-funding the remaining amount to get a better heater. A completed project will lead to the Screen presented in Fig. 3. It shows the completion of the project, where also a graphic about the estimated performance, which means the electricity and money saved and the payment plan appear.

![](/Deliverables/MidFiPrototyping/fundraiser_summary.png)

#### Investor’s Side

On the Investors side, Fig. 1 shows a pie chart with an investment portfolio. In the list below the pie chart, one can see the details of the investments and their status. There is also a “Discover” button between the chart and the list, it’s purpose is to enable a Investor exploring new projects. In Fig. 2, one can see new projects with some details. The bar indicates the current funding status while the “learn more” button on the right hand side leads to further details which are shown in Fig. 3. In Fig. 3, the Investor is able to choose the funding amount. The Grey part indicates the proportion of the project already funded, while the yellow part would be the portion the Investor is funding. There are two additional buttons, a “Project Details” and a “Invest Now” button. The first one will lead the user acting as an investor to the Project Details Screen shown in Fig. 5, where one can gain additional knowledge about the project. With the “Invest Now” button, the user can fund the predefined amount to the selected project. After the funding from the investor is done, a dropdown notification (shown in Fig. 4) will appear, afterwards leading the user back to the home screen.

![](/Deliverables/MidFiPrototyping/investor_summary.png)

### Peer Feedback

#### Testers

Alexandre Reol : 02

Luca Kummer : 05

Luca Kummer : 08

#### Crowdfunding Platform - Investor Side

User 1: (Group 8)

User one did not try to understand what the donut chart stands for. He focused on the energy and profit icons, but still was confused on what they mean. He did not try to interact with them. Especially with profit, he said “What do we invest in?”. The breakdown of the projects was understood correctly. The user perceived the bar as the proportion of the project’s proportion that has been already funded.The user quickly understood the project selection screen. He quickly found a project and pressed on the learn more button. 
In the project details screen he could not find where he can type in the amount he would like to invest. It took some time to figure the slider, and he even said that he would not like a slider, due to lack of accuracy.
He observed that there was a rating. He trusted the star review system even though he did not now what it was about. He understood that he could interact with the project details button. On the other hand, he did not understand he could interact with the invest now button.
General comments: Even though he went through the project browsing he does not seem to recall the interface.

User 2: (TA- Velko)

User 2 also seems to not grasp the concept of the investor. He is confused about the donut chart and cannot link it to the breakdown below. In the breakdown, he was able to understand the items that are listed. By clicking on the discover button he understood that this is a potential investment project list. At this point he proposes a potential sorting of the project by ROI, Impact, proximity, environmental factors etc. From this point onwards, he was able to make a payment by pressing the invest now button.
General comments: User 2 was confused with the dashboard screen. This prompts to make the first contact more intuitive.

User 3:(Group ?)

User 3 interprints the donut chart of the dashboard screen as “how many people were helped” which is incorrect. However he was able to understand what profit is and in the sequel linked the chart with the breakdown bellow. He smoothly clicks towards the projects and read the project details correctly. He is also the only user who presses the information buttons (i). The overall journey seems smooth to him, and was able to understand everything.

#### Crowdfunding Platform - Fundraiser Side

User 1 wanted more information on what he was rated on. He understood the energy consumption metric but was confused as to what the associated costs metric meant and why it was negative. The user assumes the energy savings in the new projects panel is per year instead of over the lifetime of the device, and said he'd prefer to have the annual ennergy savings for each project as well.
On the heater-page, the user didn't immediatly intuit, what the option bar on the top meant, but did figure it out without our help. When pressing the different option-buttons, he was didn't notice what had changed, leaving him confused. He only seemed to understand how the page-elements related to each other after getting to the end of the page and playing around a bit with the buttons.
At the end the user mentioned he'd like an option to pay small amounts without the payback scheme.
General comments: User 1 was confused by some of our metrics for savings and took a while to understand the layout of the heater-page.

User 2 wasn't sure what the ongoing-projects segment meant.
On the heater-page, the user was confused by what profit meant and thought the profits were for a set timeframe instead of over the device lifetime. It didn't seem immediatly obvious to him that the heater buttons were buttons for the panel below, but he caught on quickly by just trying to click them and seeing what happens. He was confused about "Pay Rest" and "Wait" buttons meant.
On the funded-page, the user remarked that savings would be a more fitting term than profit.
General comments: User 2 said he found the interface to be hard to interpret.

User 3 was confused by the wait button in the heater-page.

#### Electricity Pet

Feedback 1:
User 1 was expecting the top windows to be scrollable, so one can see more information than just the last week, maybe something including the overall health of the pet. Also the energy meter at the bottom was easy to understand, it clear that it goes from left to right when more energy is used. But the exceeded target approach was not understandable. He asked what „96%“ means, if above or just 96% of the predefined target. On the achievements page, it was not intuitive why one has to do that and also what the single points actually meant. So we should somehow explain a single achievement, if the user has difficulties to understand it. On the heat-map the feedback was mixed, the main idea is clear, but the colors only confuse, since the energy consumption is already represented by the size of the bubbles. Also one should be able to group the individual devices into groups, for example: lamps, heating, consumer electronics, etc… and last but not least, the leaderboard should be reachable not only via points, since it’s not the first thing that comes into ones mind the user wants to see it.

Feedback 2:
User 2 found that the electricity heat-map is a good representation for seeing the electricity consumption in ones household. But most of the icons in the prototype were difficult to interpret, also the term exceeding was probably not clearly enough defined. Question like, is exceeding the target a good or a bad thing? occurred. We should probably point the arrow down if we want to emphasize something bad.

Feedback 3:
Use 3 also found the heat-map/breakdown of the energy consumption into single devices (or also groups) useful and easy to understand. He also suggested that the top energy window should display more than just the current week. But he was also confused about the target which the user predefines. Is there a motivation to set a small target, can someone save too much energy? And most importantly, he wasn’t 	convinced why anyone would save energy for a pet, that hasn’t that much interaction with it. The pet does not visualize the points one achieved well or also how the user is doing, the last one is probably because we didn’t spend much time yet in „animating“ the pet. For the tester, the hole thing just felt too simple.


#### Conclusion

We see the Crowdfunding Platform as the most promising one so far.


## Hi-fidelity Prototype

Plan for Hi-Fi prototype:[see here](/Deliverables/HighFiPrototype-Preparation/investor_summary_AB_testing.pdf)

## User study

    TODO
