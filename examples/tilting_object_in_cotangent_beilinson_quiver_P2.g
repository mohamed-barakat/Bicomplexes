LoadPackage( "HomotopyCategories" );
LoadPackage( "QPA" );
LoadPackage( "LinearAlgebraForCAP" );
LoadPackage( "DerivedCategories" );

homalg_field := HomalgFieldOfRationals( );

field := homalg_field;

quiver := RightQuiver( "q(3)[x0:1->2,x1:1->2,x2:1->2,y0:2->3,y1:2->3,y2:2->3]" );;
Qq := PathAlgebra( field, quiver );;

# 
# End( Ω^0(0) ⊕ Ω^1(1) ⊕ Ω^2(2) )

A :=
  QuotientOfPathAlgebra(
    Qq,
    [ 
      Qq.x0 * Qq.y0 ,
      Qq.x1 * Qq.y1 ,
      Qq.x2 * Qq.y2 ,
      Qq.x0 * Qq.y1 + Qq.x1 * Qq.y0,
      Qq.x0 * Qq.y2 + Qq.x2 * Qq.y0,
      Qq.x1 * Qq.y2 + Qq.x2 * Qq.y1,
    ]
);;

cat := CategoryOfQuiverRepresentations( A : FinalizeCategory := false );;
cat!.compute_basis_of_hom_using_homalg := [ true, 1, homalg_field ]; 
SetIsLinearCategoryOverCommutativeRing( cat, true );;
SetCommutativeRingOfLinearCategory( cat, homalg_field );;
Finalize( cat );;

# O, O(1), O(2)
T := [ ];

mats :=
  [ [ [ 1, 0, 0 ] ], [ [ 0, 1, 0 ] ], [ [ 0, 0, 1 ] ], [ [ 0, 0, 0 ], [ -1, 0, 0 ], [ 0, -1, 0 ] ], [ [ 1, 0, 0 ], [ 0, 0, 0 ], [ 0, 0, -1 ] ], 
    [ [ 0, 1, 0 ], [ 0, 0, 1 ], [ 0, 0, 0 ] ] ];
  
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 1, 3, 3 ], mats ) );

mats :=
[ [ [ 0, 0, 0, -1, 0, 0, 0, -1 ], [ 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0 ] ], 
  [ [ 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0 ] ], 
  [ [ 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 0, 0, 0, 0, -1 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0 ], [ 0, -1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, -1, 0 ] ], [ [ 0, 0, 0, 0, 0, 0 ], [ -1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0 ], 
      [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, -1 ] ], 
  [ [ 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0 ] ] ];
      
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 3, 8, 6 ], mats ) );

mats :=
[ [ [ 0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1 ],
      [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ] ], 
  [ [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ] ], 
  [ [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ] ], 
  [ [ 0, 0, -1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], 
      [ 0, 0, 0, -1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, -1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 ] ], 
  [ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ -1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, -1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, -1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, -1, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, -1, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, -1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, -1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 1, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, -1 ] ], 
  [ [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
      [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ], [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ] ];
      
mats := List( mats, m -> MatrixByRows( field, m ) );

Add( T, QuiverRepresentation( A, [ 6, 15, 10 ], mats ) );

I := EmbeddingInHomotopyCategoryOfTheFullSubcategoryGeneratedByProjectiveObjects( cat );

T1 := List( T, E -> ApplyFunctor( I, E ) );

J := EquivalenceFromFullSubcategoryGeneratedByProjectiveObjectsIntoAdditiveClosureOfIndecProjectiveObjects( cat );

J := ExtendFunctorToHomotopyCategoryFunctor( J );

U := PreCompose( I, J );

T2 := List( T, E -> ApplyFunctor( U, E ) );

