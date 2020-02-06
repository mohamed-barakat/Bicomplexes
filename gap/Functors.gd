#############################################################################
##
##  DerivedCategories: Derived categories for additive categories
##
##  Copyright 2020, Kamal Saleh, University of Siegen
##
#! @Chapter Functors and natural transformations
#! @Section Functors
##
############################################################################

#! @Description
#!  The argument is a category of quiver representations over some finite dimensional quiver algebra. The output is an equivalence
#!  from full subcategory generated by the projective representations into the additive closure of the full subcategory generated by
#!  indecomposable projective representations.
#! @Arguments cat
#! @Returns a functor
DeclareAttribute( "EquivalenceFromFullSubcategoryGeneratedByProjectiveObjectsIntoAdditiveClosureOfIndecProjectiveObjects",
        IsQuiverRepresentationCategory );

#! @Description
#!  The argument is a category of quiver representations over some finite dimensional quiver algebra. The output is an equivalence
#!  from full subcategory generated by the injective representations into the additive closure of the full subcategory generated by
#!  indecomposable injective representations.
#! @Arguments cat
#! @Returns a full subcategory
DeclareAttribute( "EquivalenceFromFullSubcategoryGeneratedByInjectiveObjectsIntoAdditiveClosureOfIndecInjectiveObjects",
        IsQuiverRepresentationCategory );

#! @Description
#!  The input is an exceptional collection $E$ and the output is an isomorphism functor into algebroid defined over the endomorphism algebra of
#!  $\bigoplus_i E_i$ for $E_i\in$<A>E</A>.
#! @Arguments E
#! @Returns a functor
DeclareAttribute( "IsomorphismIntoAlgebroid",
        IsExceptionalCollection );

#! @Description
#!  The input is an exceptional collection <A>E</A> and the output is an isomorphism functor from algebroid defined over the endomorphism algebra of
#!  $\bigoplus_i E_i$ for $E_i \in$ <A>E</A>.
#! @Arguments E
#! @Returns a functor
DeclareAttribute( "IsomorphismFromAlgebroid",
        IsExceptionalCollection );

#! @Description
#!  The input is an algebroid <A>alg</A> defined by a finite dimensional quiver algebra $A$.
#!  The output is the isomorphism functor from <A>alg</A> into the full subcategory of category of $A^{op}$-quiver representations,
#!  which is generated by the indecomposable projective objects.
#! @Arguments alg
#! @Returns a functor
DeclareAttribute( "IsomorphismIntoFullSubcategoryGeneratedByIndecProjRepresentationsOverOppositeAlgebra",
        IsAlgebroid );

#! @Description
#!  The input is an exceptional collection <A>E</A> and the output is an isomorphism from the full subcategory generated by the
#!  exceptional collection into the full subcategory of category of $A^{op}$-quiver representations,
#!  which is generated by the indecomposable projective objects.
#! @Arguments E
#! @Returns a functor
DeclareAttribute( "IsomorphismIntoFullSubcategoryGeneratedByIndecProjRepresentationsOverOppositeAlgebra", IsExceptionalCollection );

#! @Description
#!  The input is an exceptional collection <A>E</A> and the output is an isomorphism into the full subcategory generated by the
#!  exceptional collection from the full subcategory of category of $A^{op}$-quiver representations,
#!  which is generated by the indecomposable projective objects.
#! @Arguments E
#! @Returns a functor
DeclareAttribute( "IsomorphismFromFullSubcategoryGeneratedByIndecProjRepresentationsOverOppositeAlgebra", IsExceptionalCollection );

#! @Description
#!  The input is an algebroid <A>alg</A> defined by a finite dimensional quiver algebra $A$.
#!  The output is the isomorphism functor from the full subcategory of category of $A^{op}$-quiver representations,
#!  which is generated by the indecomposable projective objects into <A>alg</A>.
#! @Arguments alg
#! @Returns a functor
DeclareAttribute( "IsomorphismFromFullSubcategoryGeneratedByIndecProjRepresentationsOverOppositeAlgebra",
        IsAlgebroid );

#! @Description
#!  The input is a homotopy category <A>H</A> := <C>HomotopyCategory</C>($C$) of some abelian category $C$. The output is the localization
#!  functor $L$ from <A>H</A> into <C>DerivedCategory</C>($C$).
#! @Arguments H
#! @Returns a functor
DeclareAttribute( "LocalizationFunctor",
        IsHomotopyCategory );

#! @Description
#!  The input is a localization functor for some homotopy category <A>H</A> := <C>HomotopyCategory</C>($C$) of some abelian category $C$ in
#!  some category $B$, i.e., send quasi-isomorphisms in <A>H</A> to isomorphisms in $B$. The output is the universal functor
#!  from <C>DerivedCategory</C>($C$) into $B$.
#! @Arguments H
#! @Returns a functor
DeclareAttribute( "UniversalFunctorFromDerivedCategory",
        IsCapFunctor );

# I can not declare them as attributes since they are installed in homalg as operations.
# Hence, this trick

#! @Description
#!  The input is a functor <A>G</A>:$D\to C$ such that $D$ is abelian category with computable enough projectives or extension of such a functor
#!  to homotopy categories. The output the left derived functor $LG:D^b(D)\to D^b(C)$.
#! @Arguments G
#! @Returns a functor
DeclareOperation( "LeftDerivedFunctor",
        [ IsCapFunctor ] );

DeclareAttribute( "LDerivedFunctor",
        IsCapFunctor );

#! @Description
#!  The input is a functor <A>F</A>:$C\to D$ such that $C$ is abelian category with computable enough injectives or extension of such a functor
#!  to homotopy categories. The output the right derived functor $RF:D^b(C)\to D^b(D)$.
#! @Arguments F
#! @Returns a functor
DeclareOperation( "RightDerivedFunctor",
        [ IsCapFunctor ] );

DeclareAttribute( "RDerivedFunctor",
        IsCapFunctor );

DeclareAttribute( "EquivalenceFunctorFromAdditiveClosure", IsCapFullSubcategory );
DeclareAttribute( "EmbeddingFunctorFromAdditiveClosure", IsCapFullSubcategory );

DeclareAttribute( "EquivalenceFunctorFromAdditiveClosure", IsExceptionalCollection );
DeclareAttribute( "EmbeddingFunctorFromAdditiveClosure", IsExceptionalCollection );
DeclareAttribute( "EquivalenceFunctorFromHomotopyCategory", IsExceptionalCollection );
DeclareAttribute( "EmbeddingFunctorFromHomotopyCategory", IsExceptionalCollection );
DeclareAttribute( "ConvolutionFunctor", IsExceptionalCollection );

DeclareAttribute( "ConvolutionFunctor", IsHomotopyCategory );


DeclareOperation( "RestrictFunctorIterativelyToFullSubcategoryOfSource",
        [ IsCapFunctor, IsCapFullSubcategory ] );


