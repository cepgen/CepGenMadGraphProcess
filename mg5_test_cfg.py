import Config.Core as cepgen

process = cepgen.Module('mg5',
    processParameters = cepgen.Parameters(
        parametersCard = 'mg5/Cards/param_card.dat',
    ),
    inKinematics = cepgen.Parameters(
        sqrtS = 13.e3,
    )
)
