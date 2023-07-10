## Q.1. Determine the highest normal form of this relation scheme.

The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
the following functional dependencies:
StudentName, courseNo → grade
EnrollmentNo, courseNo → grade
StudentName →EnrollmentNo
EnrollmentNo →StudentName

### Answer

For easy understanding let’s say attributes (StudentName, CourseNo, EnrollNo, Grade) be (A,B,C,D). Then given functional dependencies are as follows:<br>
AB->D<br>
CB->D<br>
A->C<br>
C->A<br>
Here there are two Candidate keys, AB and CB.<br>
Now AB->D and CB->D satisfy BCNF as LHS is superkey in both.<br>
But, A->C and C->A, doesn’t satisfy BCNF. Hence we check for 3NF for these 2 functional dependencies.<br>
As C and A on RHS of both the FDs are prime attributes, they satisfy 3NF.<br>
Hence for the whole relation the highest normal form is **3NF**.

### Q.2. Suppose you are given a relation R= (A, B, C, D, E ) with the following functional dependencies:{CE →D, D→B, C →A}

### a. Find all candidate keys.

Given R=(A,B,C,D,E)<br>
F.D : {CE->D,D->B,C->A}<br>
CE += {C,E,D,B,A}<br>
C += {C,A}<br>
A += {A}<br>
so {CE} is a candidate key<br>
D += {D,B}<br>
B += {B}<br>
E += {E}<br>
so CD={C,A,D,B}<br>
hence {C,A} and {C,D} are candidate keys.<br>

### b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

Since:<br>
prime attributes - C,E,D<br>
non prime attributes -A,B<br>

we can make the following normalization table (with the help of constraints provided above) :

| Normal form | CE->D | D->B | C->A |
| ----------- | ----- | ---- | ---- |
| BCNF        | yes   | No   | No   |
| 3NF         | Yes   | No   | No   |
| 2NF         | Yes   | No   | No   |

So , the relation is in **1NF**

### c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a new relation, decompose and re-compute the keys and the normal forms they satisfy

The above relation can be decomposed into three relations<br>
R1(CE->D)<br>
R2(D->B)<br>
R3(C->A)<br>

since CE,D & C are candidate keys the the above relations , these relations are already in BCNF and there is no need of further decomposition.

### Q.3. You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):

### F={ABC →D, ABD→E,CD→F,CDF →B,BF →D}

### a. Find all keys of R based on these functional dependencies.

After computing all the keys , the final candidate keys are:<br>
ABC =+= {A,B,C,D,F,E}<br>
A +={A}<br>
B+={B}<br>
C+={C}<br>
AB+={A,B}<br>
BC+={B.C}<br>
Since no subset of ABC is a candidate key , ABC is a candidate key.<br>
Similary , after computing , the other candidate keys are:<br>
{A,B,C} ,{A,C,D,F} ,{A,C,D,E}<br>
<br>
Prime attributes : {A,B,C,D,E,F}\
Non prime attributes : There are no non prime attributes .

### b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers.

Based upon the above data we can make the following normalization table:

| Normal form | ABC->D | ABD->E | CD->F | CDF->B | BF->D |
| ----------- | ------ | ------ | ----- | ------ | ----- |
| BCNF        | yes    | No     | No    | No     | No    |
| 3NF         | Yes    | Yes    | Yes   | Yes    | Yes   |

The relation is in **3NF** because , D,E,F,B,B,D all the attributes on the right hand side meet this condition \
_Left hand side should be candidate key or right hand side should be prime attribute ._\
which means that there are no transitive dependencies.

### Q.4.Write the advantages and disadvantages of normalization\*\*

#### Advantages of Normalization:

A more modest information base can be kept up as standardization disposes of the copy information. Generally speaking size of the information base is diminished thus.

Better execution is guaranteed which can be connected to the above point. As information bases become lesser in size, the goes through the information turns out to be quicker and more limited in this way improving reaction time and speed.

Narrower tables are conceivable as standardized tables will be tweaked and will have lesser segments which considers more information records per page.

Fewer files per table guarantees quicker support assignments (file modifies).

Also understands the choice of joining just the tables that are required.

#### Disadvantages of Normalization:

More tables to join as by spreading out information into more tables, the need to join table’s increments and the undertaking turns out to be more dreary. The information base gets more enthusiastically to acknowledge too.

Tables will contain codes as opposed to genuine information as the rehashed information will be put away as lines of codes instead of the genuine information. Thusly, there is consistently a need to go to the query table.

Data model turns out to be incredibly hard to question against as the information model is advanced for applications, not for impromptu questioning. (Impromptu question is an inquiry that can’t be resolved before the issuance of the question. It comprises of a SQL that is developed progressively and is typically built by work area cordial question devices.). Subsequently it is difficult to display the information base without understanding what the client wants.

As the typical structure type advances, the exhibition turns out to be increasingly slow.

Proper information is needed on the different ordinary structures to execute the standardization cycle effectively. Reckless use may prompt awful plan loaded up with significant peculiarities and information irregularity.

### Q.5. Determine the decomposition.

### Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.

### Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅ .

R1 ∩ R2 ≠ Ø means there is common attribute in R1 and R2.  
Now if we choose a decomposition positively then we can choose something like R1(S, T, U) and R2(U, V) then we can say that decomposition is lossless because common attribute is U and LHS of every FDs are candidate key, therefore it is in **2NF** as well as **3NF**.
